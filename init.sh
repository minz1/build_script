#!/bin/bash

# Colors
export TERM=xterm

red=$(tput setaf 1)             #  RED
grn=$(tput setaf 2)             #  GREEN
blu=$(tput setaf 4)             #  BLUE
cya=$(tput setaf 6)             #  CYAN
txtrst=$(tput sgr0)             #  RESET

cd "$build_dir"

if [ "$update_script" = "yes" ]; then
	. ../update.sh
else
	. ../build.sh
fi
