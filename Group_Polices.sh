#!/bin/bash

aliyun ram ListUsers > ListUser.txt
users=$(cat ListUser.txt | tr ',' '\n' | grep -o -P '(?<="UserName":").*(?=")')
for user in $users; do
    echo " "
    echo "User $user have policy directly assigned!"
    aliyun ram ListGroupsForUser --UserName=$user | tr ',' '\n' | tr '{' '\n' | tr '"' ' ' | grep GroupName
    aliyun ram ListPoliciesForUser --UserName=$user | tr ',' '\n' | tr '{' '\n' | tr '"' ' ' | grep Polic

#    echo " "
#
#    aliyun ram GetUserMFAInfo --UserName=$user | tr ',' '\n' | tr '{' '\n' | tr '"' ' '
#
#   echo " "   
#   echo "Active Keys details for user "$user
#   echo " "
#   aliyun ram ListAccessKeys --UserName $user | tr ',' '\n' | tr '[' '\n' | cut -d '"' -f 4
# | grep -o -P '(?<="UserName":").*(?=")')


#   echo $user" Last Login Date To The Console"
#   aliyun ram GetUser --UserName $user  | tr ',' '\n' | tr '{' '\n' | tr '"' ' ' | grep LastLogin | cut -d 'T' -f 1
#   echo "----------------------------------------------------------------------------------------------------"
done

#    echo " "
#    echo "Password Policy"
#    aliyun ram GetPasswordPolicy | tr ',' '\n'
#    echo " "
#    echo "VirtualMFA" 
#   aliyun ram ListVirtualMFADevices | tr ',' '\n'
#   aliyun ram GetUserMFAInfo --UserName=$user
#   echo " "
#   echo "current date:"

#   date +%Y-%m-%d

