#!/bin/bash
#command to find the latest file 
var1=$(ls -t "$1"| head -n 1)
cp "$1/$var1" test.txt
echo "Most occuring word in the file"
tr -c '[:alnum:]' '[\n*]' < test.txt | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -nr | head -n 1


#Write a Bash script to find the latest file in any given folder. The folder should be
#presented as a command line argument. Make a copy of the file and find the
#most occurring word in the file.




