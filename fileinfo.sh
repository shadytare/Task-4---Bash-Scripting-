#!/bin/bash
echo "Please,Enter a file path: " 
read path

# Get the file size
file_size=$(du -sh "fileinfo.sh")
echo "Size: $file_size"

# Get the file type
file_type=$(file -b "fileinfo.sh")
echo "Type: $file_type"

# Get the permissions of the file
file_permissions=$(ls -l "fileinfo.sh")
echo "permissions: $file_permissions"
