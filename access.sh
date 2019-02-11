#!/bin/bash

echo "Active Keys details for user "$user
echo " "
aliyun ram ListAccessKeys --UserName $user | tr ',' '\n' | tr '[' '\n' | cut -d '"' -f 4
# | grep -o -P '(?<="UserName":").*(?=")')


echo "Last Login Date To The Console for user "$user

aliyun ram GetUser --UserName $user  | tr ',' '\n' | tr '{' '\n' | tr '"' ' ' | grep LastLogin | cut -d 'T' -f 1


echo " "
echo "current date:"

date +%Y-%m-%d
