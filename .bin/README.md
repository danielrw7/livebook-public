Feel free to copy this setup:

- Sibling directories: `public` (where you work on your files), and `public-transformed` (this repo, read-only)
- Crontab: `*/15 * * * * cd [dir]/public-transformed && ./.bin/transform-all.sh && ./.bin/create-readme.sh && ./.bin/sync.sh`

