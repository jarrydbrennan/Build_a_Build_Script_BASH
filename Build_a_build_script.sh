: '
One common use of bash scripts is for releasing a “build” of your source code. Sometimes your private source code may contain developer resources or private information that you dont want to release in the published version.
'

#!/bin/bash
echo "Howdy Hey There!"
firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "changelong.md version:" $version
echo "Enter 1 to continue and 0 to exit"
read versioncontinue
if [ $versioncontinue -eq 1 ]
then
  echo "OK"
  for filename in source/*
  do
    if [ "$filename" == "source/secretinfo.md" ]
    then
      echo $filename "is not being copied"
    else
      echo $filename "is being copied"
      cp $filename build/.
    fi
  done
else
  echo "Please come back when you are ready"
fi
cd build/
echo "Build version $version contains:"
ls
cd ..