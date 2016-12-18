#!/bin/bash
oIFS="$IFS"; IFS=, ; set -- $1 ; IFS="$oIFS"
 read -p "Command to run on hosts: " VARIABLE
  echo $VARIABLE > Command.txt
for i in "$@"; do
  echo host-name = $i
  cat Command.txt | ssh -t $i 'bash -s'
done



