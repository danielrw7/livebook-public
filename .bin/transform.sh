#!/bin/bash

filename="$1"
path="./$filename"
mkdir -p $(dirname ".bin/.color/$filename")

color=$(cat ".bin/.color/$filename.color" 2>/dev/null || shuf -en1 blue black gray pink)
echo "$color" > ".bin/.color/$filename.color"
url=$(jq -rn --arg x "https://raw.githubusercontent.com/danielrw7/livebook-public/master/$1" '$x|@uri')
new_line="[![Run in Livebook](https://livebook.dev/badge/v1/$color.svg)](https://livebook.dev/run?url=$url)"

# injected content must be after first section, or else livebook will automatically create one above the setup
# https://stackoverflow.com/a/22020562
insert_at=$((-2+$(grep -n -m 1 "##" "$filename" | sed 's/\([0-9]*\).*/\1/')))

contents() {
  head -n $insert_at "$path"
  echo
  echo "## Import"
  echo
  echo "$new_line"
  echo
  echo "[View Source on GitHub](https://github.com/danielrw7/livebook-public/blob/master/$filename)"
  tail -n +$(($insert_at+1)) "$path"
}

contents > "$path.tmp"
mv "$path.tmp" "$path"

