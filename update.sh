#!/bin/bash

function updateScript() {
	echo -e ${cya}"Updating $1..." ${txtrst};
	curl https://raw.githubusercontent.com/minz1/build_script/master/$1 > ../$1-temp
	rm -rf ../$1
	mv ../$1-temp ../$1
}

updateScript "build.sh"
updateScript "init.sh"

. ../build.sh
