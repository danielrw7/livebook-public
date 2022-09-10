#!/bin/bash

contents() {
  echo "### My Public Liveview Files:"
  echo
  echo "| Name | Title | |"
  echo "|------|-------|-|"

  for filename in $(find . | sort | grep "\.livemd$" | cut -c 3-)
  do
    echo -n "| [$filename]($filename)"

    echo -n "| "
    echo -n $(head -n 1 "$filename" | cut -c 3-)

    url=$(jq -rn --arg x "https://raw.githubusercontent.com/danielrw7/livebook-public/master/$filename" '$x|@uri')
    echo -n "| [![Run in Livebook](https://livebook.dev/badge/v1/blue.svg)](https://livebook.dev/run?url=$url)"
    echo "|"
  done
}

contents > README.md
