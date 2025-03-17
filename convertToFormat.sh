#!/bin/sh

if [ "$#" -ne 1 ] || ! [ -f "$1" ]; then
  echo "Usage: $0 <pdf_file with stamps>" >&2
  exit 1
fi

inputFile="$1"
format="png"
tmpFilePrefix="stamp"
outputFolder="${inputFile%.*}"
tmpFilePath="$outputFolder/$tmpFilePrefix.$format"

if [ -e "$outputFolder" ]; then
  echo "Please remove this folder: $outputFolder"
  exit 1
fi

if [ ! -f "$inputFile" ]; then
  echo "Input file missing: $inputFile"
  exit 1
fi

# TODO: generate those, don't hardcode it
#inputFormat=
# numberOfStamps=12
# startIndexPaper=0
stamp_crops=(
  "793x696+424+116"
  "793x696+1211+116"
  "793x696+1998+116"
  "793x696+2785+116"

  "793x696+424+806"
  "793x696+1211+806"
  "793x696+1998+806"
  "793x696+2785+806"

  "793x696+424+1496"
  "793x696+1211+1496"
  "793x696+1998+1496"
  "793x696+2785+1496"
)

mkdir "$outputFolder"
# TODO: support more than one page
convert -quality 100 -density 500 "$inputFile" "$tmpFilePath"

for i in "${!stamp_crops[@]}"
do
  crop="${stamp_crops[i]}"
  echo "Croping stamp $i"
  magick "$tmpFilePath" -crop "$crop" "$outputFolder/$tmpFilePrefix.$i.$format"
done
rm "$tmpFilePath"
