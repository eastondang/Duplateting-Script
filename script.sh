#!/bin/bash
echo "🔥🔥🔥Beginning build!! 🔥🔥🔥"
firstline=$(head -1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "You are building version" $version