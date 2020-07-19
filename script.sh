#!/bin/bash

#script start
echo "🔥🔥🔥Beginning build!! 🔥🔥🔥"
firstline=$(head -1 source/changelog.md)
#split a string into an array
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]} 
echo "You are building version" $version

#user input
echo 'Do you want to continue? (enter "1" for yes, "0" for no)'
read versioncontinue
if [ $versioncontinue -eq 1 ]
then 
  echo "OK"
  for filename in source/*
  do
    echo $filename
    if [ "$filename" == "source/secretinfo.md" ]
    then
      echo "Not copying" $filename
    else
      echo "Copying" $filename
      cp $filename build/.
    fi
  done
  cd build/
  echo "Build version $version contains:" 
  ls
  cd ..
else
  echo "Please come back when you are ready"
fi
