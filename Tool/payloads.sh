#!/bin/bash

# ANSI color codes
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

NC=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)

# add file log
msfconsole --no-rlwrap --quiet > "/tmp/payload.log"

####### Welcome User
echo "													"
echo -e "${BLUE}Welcome back : ${NC}"

# Read User Platform
read -p $'\033[0;34mEnter \033[1;34mplatform \033[1;33m(Android or Windows or Linux or iOS) : \033[1;34m' platform

# Convert the input to lowercase
platform=$(echo "$platform" | tr '[:upper:]' '[:lower:]')

case $platform in
    "android") platform="Android" ;;
    "windows") platform="Windows" ;;
    "linux") platform="Linux" ;;
    "ios") platform="iOS" ;;
    "a") platform="Android" ;;
    "w") platform="Windows" ;;
    "l") platform="Linux" ;;
    "i") platform="iOS" ;;
    *) echo "Invalid platform input." ; exit 1 ;;
esac

echo "													"

# Read User Description
read -p $'\033[0;34mDo you know the \033[1;34mdescription \033[1;33mof a specific payload (optional) : \033[1;34m' description

#######  if user input
if [ "$description" == '' ]; then
  echo -e "    ${YELLOW}wait .....................${NC}"
  msfconsole -x "search type:payload platform:$platform "
else
  echo -e "    ${YELLOW}wait .....................${NC}"
  msfconsole -x "search type:payload platform:$platform description:'$description'"
fi

# sleep and remove file log
rm -f /tmp/payload.log
