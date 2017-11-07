#!/bin/bash

. build/envsetup.sh
echo -e ${cya}"Picking changes from Lineage gerrit..." ${txtrst};
# Repopicks begin here

git config --global user.email "emerytang@gmail.com"
git config --global user.name "minz1"

# Remove asserts
repopick 186687

# frameworks/av -> libstagefright: add NV21 color #
repopick 187892

# ssystem/core -> init: don't reboot to bootloader on panic #
repopick 187146

# vendor/lineage -> apns-conf: Update Ukrainian APNs #
repopick 187718

# shims
repopick 185640

# media codecs
repopick 189539

# samsung/qcom-common
repopick 191347; # [DNM] qcom-common: O bringup

# qcom dataservices
cd vendor/qcom/opensource/dataservices
git fetch https://review.lineageos.org/LineageOS/android_vendor_qcom_opensource_dataservices refs/changes/64/181464/1 && git cherry-pick FETCH_HEAD
cd ../../../..

### hardware/samsung
repopick 190634; # Add references to liblog
repopick 195655; # macloader: Move device dependent modules to /vendor
repopick -Q 'status:open+topic:samsung-libril-oreo'; ## _<sup><sub>https://review.lineageos.org/#/q/status:open+topic:samsung-libril-oreo</sup></sub>
