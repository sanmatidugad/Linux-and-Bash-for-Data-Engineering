#!/bin/bash
# Usage: checkfile.txt <file1> <file2> ...

# Check if file argument was provided. $# will count the number of arguments. if 0 then error. 
if [ "$#" -eq 0 ]; then  
  echo "Error: No file specified"
  echo "Usage: checkfile1.txt <file1> <file2> ..."
  exit 1
fi

# loop all arguments using $@. 
for FILE in "$@"; do 
  # Check if file exists. -e will catch both non-existent files and symbolic links
  if [ ! -e "$FILE" ]; then
   echo "Error, '$FILE' not found!"
   continue
  fi

  # Check if the file is aregular file. -f will make sure that we do not give in a directory
  if [ ! -e "$FILE" ]; then
    echo "Error, '$FILE' is not a valid file!"
    continue
  fi

  # Output file contents
  echo -e "\nContents of the file"
  cat "$FILE"
  
  #Show file info
  echo -e "\nFile info:"
  ls -l "$FILE"
  
  #Show file size
  echo -e "\nFile size:"
  du -h "$FILE" | awk '{print $1}'
  
  #Show the last modified time stamp
  echo -e "\nLast modified time stamp:"
  date -r "$FILE"
  
  #stat -x "$FILE"
  #stat -x keyterms.sh | sed -n '6p' | awk -F "Modify: " '{print $2}'
  	  
  echo  # Print an extra newline for separation between files
done 
