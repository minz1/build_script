#!/bin/bash

# Colors
export TERM=xterm

    red=$(tput setaf 1)             #  RED
    grn=$(tput setaf 2)             #  GREEN
    blu=$(tput setaf 4)             #  BLUE
    cya=$(tput setaf 6)             #  CYAN
    txtrst=$(tput sgr0)             #  RESET

echo -e ${cya}"Removing old build script..." ${txtrst};
rm -rf script_build.sh
echo -e ${cya}"Moving new script to new location..." ${txtrst};
mv script_build-temp.sh script_build.sh
source script_build.sh
