#!/bin/bash
directory=$1

# Traverse through each file in the directory
for file in "$directory"/*;
do
echo "File: $file"

# Display metadata using ExifTool
echo "Metadata:"
exiftool "$file"

 # Display analyzing results using Mediainfo
 echo "Analyzing :"
 mediainfo "$file"
 
 #Display data form a file using strings
 echo "Data from files:"
 strings "$file"
 
 #Display data form a file using tcpdump
 tcpdump -r "$file"
 done
