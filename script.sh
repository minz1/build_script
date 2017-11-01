#!/bin/bash

username=minz

# colors
export TERM=xterm

    red=$(tput setaf 1)             #  red
    grn=$(tput setaf 2)             #  green
    blu=$(tput setaf 4)             #  blue
    cya=$(tput setaf 6)             #  cyan
    txtrst=$(tput sgr0)             #  Reset
# ccache

if [ "$use_ccache" = "yes" ];
then
	echo -e ${blu}"CCache is enabled for this build." ${txtrst};
	export USE_CCACHE=1
	export CCACHE_DIR=/home/ccache/$username
	prebuilts/misc/linux-x86/ccache/ccache -M 50G
fi

if [ "$use_ccache" = "clean" ];
then
	export CCACHE_DIR=/home/ccache/$username
	ccache -C
	wait
	echo -e ${cya}"CCACHE Cleared." ${txtrst};
fi

# clean
if [ "$make_clean" = "yes" ];
then
	make clean && make clobber
	wait
	echo -e ${cya}"out/ Cleared." ${txtrst};
else
	echo -e ${red}"Building dirty." ${txtrst};
fi

# Build types
echo -e ${blu}"Build type set to $buildtype." ${txtrst};

# build
. build/envsetup.sh
lunch lineage_$device-$buildtype
make $target_command -j8
