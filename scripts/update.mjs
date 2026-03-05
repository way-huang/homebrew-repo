import { spawn } from 'node:child_process';

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

const scripts = ['update-coco.mjs', 'update-iosevka-fonts.mjs'];

for (const script of scripts) {
  await spawnNode(script);
}
