#!/bin/bash

. build/envsetup.sh
echo -e ${cya}"Picking changes from Lineage gerrit..." ${txtrst};
# Repopicks begin here

git config --global user.email "emerytang@gmail.com"
git config --global user.name "minz1"

### # Recovery updates
repopick 186687; ## _<sup><sub>https://review.lineageos.org/#/c/186687</sup></sub>_  
repopick 187332 187374; ## _<sup><sub>https://review.lineageos.org/#/q/change:187332+OR+change:187374</sup></sub>_  
repopick 187155; ## _<sup><sub>https://review.lineageos.org/#/c/187155</sup></sub>_

### # Bionic and native
repopick 185640; ## _<sup><sub>https://review.lineageos.org/#/c/185640</sup></sub>_  
repopick 185671; ## _<sup><sub>https://review.lineageos.org/#/c/185671</sup></sub>_

### # Apps updates
repopick 188389 188518-188526; ## _<sup><sub>https://review.lineageos.org/#/q/project:LineageOS/android_packages_apps_Camera2+branch:lineage-15.0</sup></sub>_  
repopick 188527-188529; ## _<sup><sub>https://review.lineageos.org/#/q/project:LineageOS/android_packages_apps_Gallery2+branch:lineage-15.0</sup></sub>_  
repopick 186688; ## _<sup><sub>https://review.lineageos.org/#/c/186688</sup></sub>_

### # Legacy ADB
repopick -t oreo-adb-usb-legacy; ## _<sup><sub>https://review.lineageos.org/#/q/oreo-adb-usb-legacy</sup></sub>_

### # System core updates
repopick 185888 187146; ## _<sup><sub>https://review.lineageos.org/#/q/change:185888+OR+change:187146</sup></sub>_

### # UI updates
repopick 193830 194226; ## _<sup><sub>https://review.lineageos.org/#/q/change:193830+OR+change:194226</sup></sub>_  
repopick 194378; ## _<sup><sub>https://review.lineageos.org/#/c/194378</sup></sub>_

### # Topic: android-o-camera-hal1 (188388 temporary)
repopick -Q 'status:open+topic:android-o-camera-hal1'; ## _<sup><sub>https://review.lineageos.org/#/q/status:open+topic:android-o-camera-hal1</sup></sub>_  
repopick -f 188388; ## _<sup><sub>https://review.lineageos.org/#/c/188388</sup></sub>_

### # Topic: LineageOS Features
repopick 193540; ## _<sup><sub>https://review.lineageos.org/#/c/193540</sup></sub>_  
repopick 192490; ## _<sup><sub>https://review.lineageos.org/#/c/192490</sup></sub>_  
repopick 191921 187592; ## _<sup><sub>https://review.lineageos.org/#/q/change:191921+OR+change:187592</sup></sub>_  
repopick -Q 'status:open+topic:oreo-powermenu'; ## _<sup><sub>https://review.lineageos.org/#/q/status:open+topic:oreo-powermenu</sup></sub>_  
repopick 193249 193258 191905; ## _<sup><sub>https://review.lineageos.org/#/q/change:193249+OR+change:193258+OR+change:191905</sup></sub>_  
repopick 193025 191736; ## _<sup><sub>https://review.lineageos.org/#/q/change:193025+OR+change:191736</sup></sub>_  
repopick -Q 'status:open+topic:oreo-tiles'; ## _<sup><sub>https://review.lineageos.org/#/q/status:open+topic:oreo-tiles</sup></sub>_  
repopick 193544 192490 193490 193770; ## _<sup><sub>https://review.lineageos.org/#/q/change:193544+OR+change:192490+OR+change:193490+OR+change:193770</sup></sub>_

### # Topic: LineageOS Lights
repopick 193156; ## _<sup><sub>https://review.lineageos.org/#/q/change:193156</sup></sub>_  
cd $(gettop)/frameworks/base/; rm -rf .git/rebase-apply; curl https://github.com/AdrianDC/lineage_development_sony8960/commit/fbbac8c497fe3b036226a38421eb6a94f32b1ec0.patch | git am -3; cd $(gettop)/;  
repopick -Q 'status:open+topic:oreo-lights'; ## _<sup><sub>https://review.lineageos.org/#/q/status:open+topic:oreo-lights</sup></sub>

### hardware/samsung
repopick 190634; # Add references to liblog
repopick 195655; # macloader: Move device dependent modules to /vendor
repopick -Q 'status:open+topic:samsung-libril-oreo'; ## _<sup><sub>https://review.lineageos.org/#/q/status:open+topic:samsung-libril-oreo</sup></sub>

### device/samsung/qcom-common
repopick 192817; # qcom-common: Move lineage specific overlays to overlay-lineage
#repopick 192835; # qcom-common: Enable HWC2
repopick 191347; # [DNM] qcom-common: O bringup
#repopick 193020; # qcom-common: Enable passthrough graphics allocator
