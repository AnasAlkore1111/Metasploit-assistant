#!/bin/bash

msfconsole --no-rlwrap --quiet > "/tmp/payload.log"


echo 'Welcome back :'

read -p'hi how to platform  android OR windows OR linux OR ios .. ' platform

read -p 'Do you know the description of a specific payload ..' description

if [ "$name" == '' ]
then
  echo "wait ....................."
  msfconsole -x "search type:payload platform:$platform "

else
  msfconsole -x "search type:payload platform:$platform description:'$description'"
fi

sleep 120

rm -f /tmp/*.log
