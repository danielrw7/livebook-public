for file in $(find . | grep "\.livemd$" | cut -c 3-)
do
  rm "$file"
  echo "removed: $file"
done

for file in $(find ../public | grep "\.livemd$" | cut -c 11-)
do
  mkdir -p $(dirname "$file")
  cp "../public/$file" "$file"
  ./.bin/transform.sh "$file"
  echo "done with: $file"
done

echo "done"

