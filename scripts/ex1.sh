#!/bin/sh

rm episode??*
for fn in $(ls *.md)
do
  newname=$(echo $fn|cut -d- -f1)
  grep -E "^> " ${fn} > episode${newname}
  if [ `stat -c%s episode${newname}` -eq 0 ]
  then
    rm episode${newname}
  fi
done

for fn in $(ls episode*)
do
  sed -i "s/^> //g" $fn
  sed -i "s/\"/\'/g" $fn
done
