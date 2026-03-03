import { promises as fs, readFileSync } from 'fs';
import crypto from 'crypto';
import https from 'https';
import http from 'http';
import os from 'node:os'

const BASE_URL = readFileSync(`${os.homedir()}/.local/share/coco/config`, 'utf-8').trim()

const FORMULA_FILE = 'Formula/coco.rb';
const VERSION_URL = `${BASE_URL}/coco_latest_version.txt`;

const PLATFORMS = {
  'darwin_amd64': 'macOS Intel',
  'darwin_arm64': 'macOS ARM'
};

// Helper to fetch URL content
function fetchURL(url) {
  return new Promise((resolve, reject) => {
    const client = url.startsWith('https') ? https : http;
    client.get(url, (res) => {
      if (res.statusCode === 302 || res.statusCode === 301) {
        return fetchURL(res.headers.location).then(resolve).catch(reject);
      }
      if (res.statusCode !== 200) {
        return reject(new Error(`HTTP ${res.statusCode}: ${url}`));
      }
      const chunks = [];
      res.on('data', chunk => chunks.push(chunk));
      res.on('end', () => resolve(Buffer.concat(chunks)));
      res.on('error', reject);
    }).on('error', reject);
  });
}

// Calculate SHA256 of buffer
function calculateSHA256(buffer) {
  return crypto.createHash('sha256').update(buffer).digest('hex');
}

async function main() {
  try {
    console.log('📦 Fetching latest coco version...');
    const versionBuffer = await fetchURL(VERSION_URL);
    let latestVersion = versionBuffer.toString().trim();

    if (!latestVersion) {
      throw new Error('Failed to fetch latest version');
    }

    // Remove 'v' prefix if present (e.g., v0.111.4 -> 0.111.4)
    if (latestVersion.startsWith('v')) {
      latestVersion = latestVersion.slice(1);
    }

    console.log(`✅ Latest version: ${latestVersion}`);

    // Read current formula
    const formulaContent = await fs.readFile(FORMULA_FILE, 'utf8');
    const currentVersionMatch = formulaContent.match(/version "([^"]+)"/);
    const currentVersion = currentVersionMatch ? currentVersionMatch[1] : 'unknown';

    console.log(`📋 Current version: ${currentVersion}`);

    if (currentVersion === latestVersion) {
      console.log('✅ Formula is already up to date!');
      return;
    }

    console.log(`🔄 Updating formula from ${currentVersion} to ${latestVersion}...`);

    // Download and calculate SHA256 for each platform
    const checksums = {};

    for (const [platform, name] of Object.entries(PLATFORMS)) {
      console.log(`\n🔍 Processing ${name}...`);

      const filename = `coco_${latestVersion}_${platform}.tar.gz`;
      const url = `${BASE_URL}/${filename}`;

      console.log(`  Downloading ${url}`);

      try {
        const buffer = await fetchURL(url);
        const sha256 = calculateSHA256(buffer);
        checksums[platform] = sha256;
        console.log(`  ✅ SHA256: ${sha256}`);
      } catch (error) {
        console.error(`  ❌ Failed to download ${url}: ${error.message}`);
        throw error;
      }
    }

    // Update the formula file
    console.log('\n📝 Updating formula file...');

    let updatedContent = formulaContent;

    // Update version
    updatedContent = updatedContent.replace(/version "[^"]+"/, `version "${latestVersion}"`);

    // Update SHA256s for each platform
    // The formula uses #{version} in URLs, so we only need to update sha256 values
    for (const [platform] of Object.entries(PLATFORMS)) {
      const sha256 = checksums[platform];

      // Find the sha256 for this platform by looking for the pattern after the platform's URL
      // Pattern: url "...darwin_amd64.tar.gz" followed by sha256 "..."
      const platformRegex = new RegExp(
        `(coco_#{version}_${platform}\\.tar\\.gz"\\s+sha256 ")[a-f0-9]{64}(")`,
        'g'
      );
      updatedContent = updatedContent.replace(platformRegex, `$1${sha256}$2`);
    }

    // Write updated content
    await fs.writeFile(FORMULA_FILE, updatedContent, 'utf8');

    console.log('✅ Formula updated successfully!');

    // Show summary
    console.log('\n📊 Summary:');
    console.log(`  Version: ${currentVersion} → ${latestVersion}`);
    for (const [platform, name] of Object.entries(PLATFORMS)) {
      console.log(`  ${name}: ${checksums[platform]}`);
    }

    console.log('\n✅ Done! You can now test the formula with:');
    console.log(`  brew install --build-from-source ${FORMULA_FILE}`);
    console.log('\n📝 Don\'t forget to commit the changes!');

  } catch (error) {
    console.error(`\n❌ Error: ${error.message}`);
    process.exit(1);
  }
}

main();
