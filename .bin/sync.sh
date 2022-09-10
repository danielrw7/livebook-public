git add .

affected_files=$(git status -s | grep "\.livemd$" | sed -e 's/^.../ /g' -e 's/.......$//g' | tr '\n' ', ' | sed -e 's/,$/\n/' -e 's/^.//')
if [ "$affected_files" != "" ]; then
  affected_files=" ($affected_files)"
fi

now=$(TZ="America/New_York" date +"%Y-%m-%d %T")
git commit -m "Backup at $now$affected_files"

export GCM_CREDENTIAL_STORE=gpg
export GPG_TTY=$(tty)
git push origin master

