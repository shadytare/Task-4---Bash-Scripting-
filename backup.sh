#!/bin/bash

backup_dir="/home/shady/Desktop/BackUp"
Backup_file="$backup_dir/home_backup.tar.gz"
home_dir="/home"

#create backup
tar -czf "$Backup_file" "$home_dir"
