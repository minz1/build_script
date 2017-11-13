#!/bin/bash

# Colors
export TERM=xterm

    red=$(tput setaf 1)             #  RED
    grn=$(tput setaf 2)             #  GREEN
    blu=$(tput setaf 4)             #  BLUE
    cya=$(tput setaf 6)             #  CYAN
    txtrst=$(tput sgr0)             #  RESET

function updateScript() {
	echo -e ${cya}"Updating $1..." ${txtrst};
	curl https://raw.githubusercontent.com/minz1/build_script/master/$1 > ../$1-temp
	rm -rf ../$1
	mv ../$1-temp ../$1
}

updateScript "script_build.sh"
updateScript "repopicks.sh"
