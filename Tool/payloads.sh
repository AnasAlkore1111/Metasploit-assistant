#!/bin/bash

# ANSI color codes
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# add file log
msfconsole --no-rlwrap --quiet > "/tmp/payload.log"

####### Welcome User
echo -e "${BLUE}Welcome back : ${NC}"

# Read User Platform
read -p $'\033[1;31mhi how to platform  android OR windows OR linux OR ios .. \033[1;32m' platform

echo "													"

# Read User Description
read -p $'\033[1;31mDo you know the description of a specific payload .. \033[1;32m' description

#######  if user input
if [ "$description" == '' ]; then
  echo -e "    ${YELLOW}wait .....................${NC}"
  msfconsole -x "search type:payload platform:$platform "
else
  echo -e "    ${YELLOW}wait .....................${NC}"
  msfconsole -x "search type:payload platform:$platform description:'$description'"
fi

# sleep and remove file log
sleep 1
rm -f /tmp/*.log
