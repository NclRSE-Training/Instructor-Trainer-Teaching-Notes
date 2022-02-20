for fn in $(ls episode*)
do
  exercise=0
  while read ln
  do
    if [[ $ln == \#\#* ]]
    then
      exercise=`expr ${exercise} + 1`
      newname=${fn}_ex${exercise}.md
      echo $newname
      title='"'${ln:3}'"'
      episode=${fn:7}
      nextex=`expr ${exercise} + 1`
  echo --- >> $newname
  echo layout: default >> $newname
  echo title: ${title} >> $newname
  echo next_page: Episode ${episode} Exercise ${nextex} >> $newname
  echo next_link: episode${episode}_ex${nextex} >> $newname
  echo --- >> $newname
  echo >> $newname
else
      echo $ln >> $newname
    fi
  done < ${fn}
done
