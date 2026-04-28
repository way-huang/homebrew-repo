import { execFileSync, spawn } from 'node:child_process';
import { readFileSync } from 'node:fs';

function spawnNode(file) {
  const { promise, resolve, reject } = Promise.withResolvers();

  console.log(`exec ${file}`);

  const child = spawn(process.execPath, [import.meta.dirname + '/' + file], {
    stdio: 'inherit'
  });

  child.on('exit', code => {
    if (code === 0) return resolve();
    reject(new Error(`exit code ${code}`));
  });

  child.on('error', err => {
    reject(err);
  });

  return promise;
}

function runGit(args) {
  return execFileSync('git', args, {
    cwd: import.meta.dirname + '/..',
    encoding: 'utf8'
  }).trim();
}

function getStatusEntries(files) {
  const output = runGit(['status', '--porcelain', '--', ...files]);
  return output ? output.split('\n').filter(Boolean) : [];
}

function ensureTargetsAreClean(name, files) {
  const dirtyEntries = getStatusEntries(files);
  if (dirtyEntries.length > 0) {
    throw new Error(
      `Refusing to auto-commit ${name}: target files already have local changes:\n${dirtyEntries.join('\n')}`
    );
  }
}

function commitTargets(files, message) {
  const dirtyEntries = getStatusEntries(files);
  if (dirtyEntries.length === 0) {
    console.log('No file changes detected; skipping commit.');
    return;
  }

  runGit(['add', '--', ...files]);
  runGit(['commit', '-m', message]);
  console.log(`Created commit: ${message}`);
}

function readVersion(file) {
  const content = readFileSync(import.meta.dirname + '/../' + file, 'utf8');
  const match = content.match(/version\s+"([^"]+)"/);
  return match ? match[1] : 'unknown';
}

const scripts = [
  {
    file: 'update-coco.mjs',
    name: 'coco',
    targets: ['Formula/coco.rb'],
    getCommitMessage() {
      return `coco ${readVersion('Formula/coco.rb')}`;
    }
  },
  {
    file: 'update-iosevka-fonts.mjs',
    name: 'iosevka fonts',
    targets: ['Casks/fonts/iosevka'],
    getCommitMessage() {
      return `iosevka fonts ${readVersion('Casks/fonts/iosevka/font-iosevka-essential.rb')}`;
    }
  }
];

for (const script of scripts) {
  ensureTargetsAreClean(script.name, script.targets);
  await spawnNode(script.file);
  commitTargets(script.targets, script.getCommitMessage());
}
