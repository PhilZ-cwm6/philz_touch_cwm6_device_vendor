## CM10.2 Build Instructions for Celox HD

### Setting Up The Source Tree
You will first need to follow the instructions at http://source.android.com/source/initializing.html to setup and initialize your build environment.

Next, you will need to setup your working directory, download repo and init the CM10.2 repo in your new working directory:
```
1) mkdir ~/cm-10.2
2) cd ~/cm-10.2
3) curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo
4) chmod a+x ~/bin/repo
5) repo init -u git://github.com/CyanogenMod/android.git -b cm-10.2
```
The rest of the commands must be executed while in ~/cm-10.2

### Include the file .repo/local_manifests/local_manifest.xml to allow these additional repositories to be synced:
```
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="CyanogenMod/android_device_samsung_msm8660-common" path="device/samsung/msm8660-common" remote="github" revision="cm-10.2" />
  <project name="CyanogenMod/android_device_samsung_celox-common" path="device/samsung/celox-common" remote="github" revision="cm-10.2" />
  <project name="CyanogenMod/android_device_samsung_qcom-common" path="device/samsung/qcom-common" remote="github" revision="cm-10.2" />
  <project name="CyanogenMod/android_kernel_samsung_msm8660-common" path="kernel/samsung/msm8660-common" remote="github" revision="cm-10.2" />
  <project name="titanic-fanatic/android_device_samsung_celoxhd" path="device/samsung/celoxhd" remote="github" revision="cm-10.2" />
  <project name="titanic-fanatic/android_vendor_samsung_celoxhd" path="vendor/samsung/celoxhd" remote="github" revision="cm-10.2" />
  <project name="TheMuppets/proprietary_vendor_samsung" path="vendor/samsung" remote="github" revision="cm-10.2" />
</manifest>
```
NOTE: Under the kernel folder you need to add "arch/arm/configs/cyanogenmod_celoxhd_defconfig".  Download the file from here:  https://raw.github.com/titanic-fanatic/android_kernel_samsung_msm8660-common/cm-10.2/arch/arm/configs/cyanogenmod_celoxhd_defconfig


### Download or update all repositories:
```
repo sync -j4   
```
NOTE: The "4" may be replaced by # of CPU cores on your PC


### Get all the prebuilts, like ROM Manager:
```
vendor/cm/get-prebuilts
```

### Optimize your Linux installation for future rebuilds:
```
echo "export USE_CCACHE=1" >> ~/.bashrc
prebuilts/misc/linux-x86/ccache/ccache -M 20G
source ~/.bashrc
```
NOTE: 20GB cache here, but can be changed later

### Ready to build!
```
. build/envsetup.sh
brunch cm_celoxhd-eng
```

Subsequent builds only require the brunch command above, but if you modified BoardConfig.mk, you'll need to clean out the build output folder before running brunch (in order to pick up its changes). In that case, run this before using brunch:
```
make clobber
```


### OPTIONAL: If you want to build ClockworkMod:
```
. build/envsetup.sh
. build/tools/device/makerecoveries.sh cm_celoxhd-eng 
```

