#!/bin/bash

username=minz
outdir=out/target/product/"$device"

# sync repositories
if [ "$sync_repositories" = "true" ]; then
	repo sync --force-sync -j9
fi

# ccache
if [ "$use_ccache" = "yes" ]; then
	echo -e ${blu}"CCache is enabled for this build." ${txtrst};
	export USE_CCACHE=1
	export CCACHE_DIR=/home/ccache/"$username"
	prebuilts/misc/linux-x86/ccache/ccache -M 500G
fi

if [ "$use_ccache" = "clean" ]; then
	export CCACHE_DIR=/home/ccache/"$username"
	ccache -C
	wait
	echo -e ${grn}"CCache Cleared." ${txtrst};
fi

# clean
if [ "$make_clean" = "yes" ]; then
	if [ -d "$outdir" ]; then
		make clean -j9
		wait
		echo -e ${grn}"out/ Cleared." ${txtrst};
	else
		echo -e ${grn}"No need to make clean." ${txtrst};
	fi
else
	if [ -d "$outdir" ]; then
		cd "$outdir"
		rm -rf *.zip && rm -rf *.md5sum
		cd ../../../..
	fi
	echo -e ${red}"Building dirty." ${txtrst};
fi

# Build types
echo -e ${blu}"Build type set to $build_type." ${txtrst};

# build
. build/envsetup.sh
lunch "${lunch_command}_${device}-${build_type}"

if [ "$treble_device" = "true" ]; then
	export WITHOUT_CHECK_API=true
fi

make "$target_command" -j9
