#!/bin/bash

username=minz
outdir=out/target/product/$device

# colors
export TERM=xterm

    red=$(tput setaf 1)             #  RED
    grn=$(tput setaf 2)             #  GREEN
    blu=$(tput setaf 4)             #  BLUE
    cya=$(tput setaf 6)             #  CYAN
    txtrst=$(tput sgr0)             #  RESET

cd "$build_dir"

if [ "$update_script" = "yes" ]; then
	curl https://raw.githubusercontent.com/minz1/build_script/master/update-script.sh > ../update-script-temp.sh
	echo -e ${cya}"Removing old updater script..." ${txtrst};
	rm -rf ../update-script.sh
	echo -e ${cya}"Replacing updater script..." ${txtrst};
	mv ../update-script-temp.sh ../update-script.sh
	update_script=no
	. ../update-script.sh
	wait
fi

# sync repositories
if [ "$sync_repositories" = "true" ]; then
	repo sync --force-sync -j8
	if ["$build_dir" = "lineage-15.0"]; then
		. ../repopicks.sh
	fi
fi

# ccache
if [ "$use_ccache" = "yes" ]; then
	echo -e ${blu}"CCache is enabled for this build." ${txtrst};
	export USE_CCACHE=1
	export CCACHE_DIR=/home/ccache/$username
	prebuilts/misc/linux-x86/ccache/ccache -M 100G
fi

if [ "$use_ccache" = "clean" ]; then
	export CCACHE_DIR=/home/ccache/$username
	ccache -C
	wait
	echo -e ${grn}"CCache Cleared." ${txtrst};
fi

# clean
if [ "$make_clean" = "yes" ]; then
	make clean && make clobber
	wait
	echo -e ${grn}"out/ Cleared." ${txtrst};
else
	if [ -d "$outdir" ]; then
		cd $outdir
		rm -rf *.zip && rm -rf *.md5sum
		cd ../../../..
	fi
	echo -e ${red}"Building dirty." ${txtrst};
fi

# Build types
echo -e ${blu}"Build type set to $build_type." ${txtrst};

# build
. build/envsetup.sh
lunch lineage_$device-$build_type
make $target_command -j8
