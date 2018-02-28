#!/bin/bash

if [ "$update_script" = "yes" ]; then
	echo -e ${cya}"Removing old build script..." ${txtrst};
	rm -rf build.py
	echo -e ${cya}"Replacing build script..." ${txtrst};
	wget https://raw.githubusercontent.com/minz1/build_script/master/build.py
fi

python3 build.py $device $target_command $build_dir $sync_repositories $use_cacche $build_type $make_clean 
