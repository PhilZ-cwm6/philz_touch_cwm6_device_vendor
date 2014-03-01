HOW-TO BUILD:
=============

**This short guide assumes you're on Ubuntu 11.04 or above** and have your build enviroment setup already.

Getting the (right) source
--------------------------

First, we need to create directories for the build (system can be whatever you want to name your working directory):

    $ mkdir -p ~/bin

    $ mkdir -p ~/android/system

Now we'll need repo. Let's download it and make it executable:

    $ curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo

    $ chmod a+x ~/bin/repo

Log out and back in so the changes take effect.

Now initialized the repository and pull the source (with my repos attached):

    $ cd ~/android/system/
    
    $ repo init -u git://github.com/CyanogenMod/android.git -b cm-10.1
    
    $ repo sync

Depending on your connection, this might take awhile.

Getting my ZTE Sequent repo
	
	$ cd ~/android/system/device/

	$ mkdir zte

	$ cd zte

	$ git clone https://github.com/playfulgod/android_device_zte_warp2.git -b cm-10.1 warp2

Then cd to the kernel directory:

	$ cd ~/android/system/kernel

	$ mkdir zte

	$ git clone https://github.com/playfulgod/kernel_zte_warp2.git warp2

Extract necessary binaries and proprietary files 
------------------------------------------------

We will need to reuse some proprietary files from the stock ROM (Need to have adb working and connect your phone up to a PC via USB.):

    $ cd
    
    $ cd ~/android/system/device/zte/warp2
    
    $ ./extract-files.sh

Building
-------------
Once thats done you can start compiling.

Follow the aosp instructions on setting up the build environment. - http://source.android.com/source/download.html

When the environment is setup, we need to grab a copy of Term.apk. This is necessary to build CM10.

    $ cd ~/android/system/vendor/cm

    $ ./get-prebuilts

Now, we build (system being your work directory):

    $ cd ~/android/system

To build for the ZTE Sequent:
    
    $ . build/envsetup.sh && brunch warp2


Installing
---------------
If the build was successful, you can now take the update zip found in out/target/product/warp2/ and flash using a custom recovery. Make sure to grab the latest Gapps to complete the experience.

When you want to rebuild with new changes to the BoardConfig.mk or after syncing to the latest CM src make sure to do the following before you recompile.

    $ make clobber



