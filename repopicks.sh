. build/envsetup.sh

# system/core -> init: don't reboot to bootloader on panic #
repopick 187146

# ssystem/core -> Restore support for legacy f_adb interface #
repopick 185642
repopick 186246

# vendor/lineage -> apns-conf: Update Ukrainian APNs #
repopick 187718

# hardware/samsung
repopick 185890
repopick 190989
repopick 190990
repopick 190991
repopick 190992
repopick 190995
repopick 191028
repopick 191029
repopick 191030
repopick 195868

# ril
repopick 195755

# android-o-camera-hal + sepolicy #
repopick 186244
repopick 186245

# android-o-camera-hal #   frameworks_av
repopick 187558 # libcameraservice: Don't pass NULL args on setCallbacks call
repopick 187559 # camera/media: Support for legacy camera HALv1   Y
repopick 187560 # libstagefright: Support for legacy camera/encoder buffers?
repopick 187561 # OMXNodeInstance: Fix legacy HAL1 after merge of android-7.1.0_r7
repopick 186713 -f #camera parameters extra support

# frameworks/av -> libstagefright: add NV21 color #
#repopick 187892
#!!!!https://review.lineageos.org/#/c/194415/

# shims android_bionic
repopick 185640

#media codecs frameworks_base
repopick 189539

# yes
cd vendor/qcom/opensource/dataservices
git fetch https://review.lineageos.org/LineageOS/android_vendor_qcom_opensource_dataservices refs/changes/64/181464/1 && git cherry-pick FETCH_HEAD
cd ../../../..
