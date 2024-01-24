#!/bin/bash

password_length=0

if [ "$#" -gt 0 ] 
then
if [ "$1" -gt 0 ]
then
password_length=$1
fi
fi 
password_complexity=$2

if [ "$password_complexity" == "high" ]
then 
password_chars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789~!@#$%^&*()_+<>?{}:;',./"
elif [ "$password_complexity" == "normal" ] 
then
password_chars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
else
password_chars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
fi

# Generate random password
password=""
for ((i=0; i<password_length; i++))
do
password+="${password_chars:$((RANDOM % ${#password_chars})):1}"
done

echo "Generated password: $password"
