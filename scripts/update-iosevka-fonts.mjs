/**
 * 更新 Iosevka 字体 cask 文件的版本和 SHA256 值
 *
 * 使用方法:
 *   bun scripts/update-iosevka-fonts.mjs [version]
 *
 * 如果不提供版本号，将通过 git ls-remote 获取最新版本
 */

import fs from 'fs';
import path from 'path';
import { execSync } from 'child_process';

const __dirname = import.meta.dir;

const CASKS_DIR = path.join(__dirname, '..', 'Casks', 'font-iosevka');
const SHA256_URL_TEMPLATE =
  'https://github.com/be5invis/Iosevka/releases/download/v{VERSION}/SHA-256.txt';

// 字体文件映射：cask 文件名 -> SHA256 文件中的文件名模式
const FONT_MAPPINGS = {
  'font-iosevka-essential.rb': 'PkgTTF-Iosevka-',
  'font-iosevka-aile-essential.rb': 'PkgTTF-IosevkaAile-',
  'font-iosevka-term-essential.rb': 'PkgTTF-IosevkaTerm-',
  'font-iosevka-combined-essential.rb': null // 这个文件只需要更新版本号
};

/**
 * 从 git ls-remote 获取最新版本
 */
function getLatestVersion() {
  try {
    const output = execSync(
      'git ls-remote -t https://github.com/be5invis/Iosevka',
      { encoding: 'utf8' }
    );

    // 解析输出，提取所有版本标签
    // 输出格式: "hash\trefs/tags/v1.0.0" 或 "hash\trefs/tags/v1.0.0^{}"
    const lines = output.trim().split('\n');
    const versions = [];
    const seenVersions = new Set();

    for (const line of lines) {
      // 匹配 refs/tags/v<version>，排除 ^{} 解引用标签
      const match = line.match(/refs\/tags\/v([^\^]+?)(?:\^{})?$/);
      if (match) {
        const version = match[1];
        // 避免重复（因为可能有解引用标签）
        if (!seenVersions.has(version)) {
          seenVersions.add(version);
          versions.push(version);
        }
      }
    }

    if (versions.length === 0) {
      throw new Error('No version tags found');
    }

    // 按版本号排序（语义化版本排序）
    versions.sort((a, b) => {
      const aParts = a.split('.').map(Number);
      const bParts = b.split('.').map(Number);
      const maxLength = Math.max(aParts.length, bParts.length);

      for (let i = 0; i < maxLength; i++) {
        const aPart = aParts[i] || 0;
        const bPart = bParts[i] || 0;
        if (aPart !== bPart) {
          return bPart - aPart; // 降序排列
        }
      }
      return 0;
    });

    // 返回最新版本（第一个）
    return versions[0];
  } catch (error) {
    throw new Error(
      `Failed to fetch latest version: ${
        error instanceof Error ? error.message : String(error)
      }`
    );
  }
}

/**
 * 下载 SHA256 文件
 */
async function downloadSHA256File(version) {
  const url = SHA256_URL_TEMPLATE.replace('{VERSION}', version);

  try {
    const response = await fetch(url, {
      headers: {
        'User-Agent': 'Bun'
      }
    });

    if (!response.ok) {
      throw new Error(
        `Failed to download SHA256 file: HTTP ${response.status}`
      );
    }

    const data = await response.text();
    return data;
  } catch (error) {
    throw new Error(
      `Failed to download SHA256 file: ${
        error instanceof Error ? error.message : String(error)
      }`
    );
  }
}

/**
 * 解析 SHA256 文件，返回文件名到 SHA256 的映射
 */
function parseSHA256File(content) {
  const mapping = {};
  const lines = content.split('\n');

  for (const line of lines) {
    const trimmed = line.trim();
    if (!trimmed) continue;

    // 格式: "sha256  filename"
    const match = trimmed.match(/^([a-f0-9]{64})\s+(.+)$/);
    if (match) {
      const [, sha256, filename] = match;
      mapping[filename] = sha256;
    }
  }

  return mapping;
}

/**
 * 更新 cask 文件
 */
function updateCaskFile(filename, version, sha256) {
  const filePath = path.join(CASKS_DIR, filename);

  if (!fs.existsSync(filePath)) {
    console.error(`Warning: File not found: ${filePath}`);
    return false;
  }

  let content = fs.readFileSync(filePath, 'utf8');
  let updated = false;

  // 更新版本号
  const versionRegex = /version\s+"([^"]+)"/;
  const versionMatch = content.match(versionRegex);
  if (versionMatch && versionMatch[1] !== version) {
    content = content.replace(versionRegex, `version "${version}"`);
    updated = true;
    console.log(`  Updated version: ${versionMatch[1]} -> ${version}`);
  } else if (versionMatch && versionMatch[1] === version) {
    console.log(`  Version already up to date: ${version}`);
  }

  // 更新 SHA256（如果提供了）
  if (sha256 !== null) {
    const sha256Regex = /sha256\s+"([^"]+)"/;
    const sha256Match = content.match(sha256Regex);
    if (sha256Match && sha256Match[1] !== sha256) {
      content = content.replace(sha256Regex, `sha256 "${sha256}"`);
      updated = true;
      console.log(`  Updated SHA256: ${sha256Match[1]} -> ${sha256}`);
    } else if (sha256Match && sha256Match[1] === sha256) {
      console.log(`  SHA256 already up to date`);
    }
  }

  if (updated) {
    fs.writeFileSync(filePath, content, 'utf8');
    console.log(`✓ Updated ${filename}`);
  } else {
    console.log(`- No changes needed for ${filename}`);
  }

  return updated;
}

/**
 * 主函数
 */
async function main() {
  try {
    // 获取版本号
    let version = process.argv[2];

    if (!version) {
      console.log('Fetching latest version from git ls-remote...');
      version = getLatestVersion();
      console.log(`Latest version: ${version}`);
    } else {
      // 移除可能的 'v' 前缀
      version = version.replace(/^v/, '');
      console.log(`Using version: ${version}`);
    }

    // 下载 SHA256 文件
    console.log('\nDownloading SHA256 file...');
    const sha256Content = await downloadSHA256File(version);
    const sha256Map = parseSHA256File(sha256Content);

    console.log(
      `Found ${Object.keys(sha256Map).length} entries in SHA256 file\n`
    );

    // 更新每个 cask 文件
    console.log('Updating cask files...\n');

    for (const [filename, filePattern] of Object.entries(FONT_MAPPINGS)) {
      console.log(`Processing ${filename}:`);

      if (filePattern === null) {
        // 只需要更新版本号
        updateCaskFile(filename, version, null);
      } else {
        // 需要更新版本号和 SHA256
        const zipFilename = `${filePattern}${version}.zip`;
        const sha256 = sha256Map[zipFilename];

        if (!sha256) {
          console.error(`  Error: SHA256 not found for ${zipFilename}`);
          continue;
        }

        updateCaskFile(filename, version, sha256);
      }

      console.log('');
    }

    console.log('Done!');
  } catch (error) {
    console.error(
      'Error:',
      error instanceof Error ? error.message : String(error)
    );
    process.exit(1);
  }
}

// 运行主函数
if (import.meta.main) {
  main();
}
