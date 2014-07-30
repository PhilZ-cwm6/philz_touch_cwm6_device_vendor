#!/sbin/sh

# Script to verify that the radio is at least newer than a specified minimum.
#
# Usage
#   arguments are in the form MODEL:MINVERSION (e.g. "I727:UCMC1 I727R:UXUMA7")
#   result 0: radio is equal to or newer than the minimum radio version
#   result 1: radio is older than the minimum radio version

# Variables
RADIO_PARTITION=/dev/block/mmcblk0p17
MOUNT_POINT=/tmp/radio_partition
FILE_CONTAINING_VERSION=image/DSP2.MBN
IMAGE_TO_CHECK=/tmp/radio_image_to_check

# ui_print by Chainfire
OUTFD=$(ps | grep -v "grep" | grep -o -E "update_binary(.*)" | cut -d " " -f 3);
ui_print() {
  if [ "$OUTFD" != "" ]; then
    echo "ui_print ${1} " 1>&$OUTFD;
    echo "ui_print " 1>&$OUTFD;
  else
    echo "${1}";
  fi;
}

# Greetings - echo goes to recovery.log, ui_print goes to screen and recovery.log
echo "test_radio_version.sh starting with arguments: $@"
ui_print "Verifying that radio is Jellybean or newer..."

# Extract the firmware image
echo "Copying the radio to /tmp..."
mkdir $MOUNT_POINT
mount -r $RADIO_PARTITION $MOUNT_POINT
cp $MOUNT_POINT/$FILE_CONTAINING_VERSION $IMAGE_TO_CHECK
umount $MOUNT_POINT
rmdir $MOUNT_POINT

# Determine the radio model
#
# There is a string with "SGH-" or "SC-" followed by the model
#   Examples: SGH-I727 SGH-I727R SGH-T989D SC-05D
#
# Search for "SC-" first since "SGH-" also appears in SC-05D radio
# blobs. The radio version begins with "SC" so therefore we need to
# ignore the "SGH-" result.
echo "Searching radio image for model..."
RADIO_MODEL=`strings $IMAGE_TO_CHECK | grep -E ^SC- -m 1 | sed -e 's/-//'`
if [ "$RADIO_MODEL" == "" ]; then
    RADIO_MODEL=`strings $IMAGE_TO_CHECK | grep -E ^SGH- -m 1 | cut -d - -f 2`
    if [ "$RADIO_MODEL" == "" ]; then
        ui_print "ERROR: Could not determine the radio model."
        rm $IMAGE_TO_CHECK
        exit 1
    fi
fi
ui_print "Found radio model: $RADIO_MODEL"

# Determine the radio version
#
# Grep out the firmware version based on the model.
# The version string is assumed to be in this format:
#   model name, followed by four or five capital letters,
#   followed by either a number (1-9) or a capital letter
#   Examples: I727UCMC1 I727UCLL3 I727UCLK4 I727RUXUMA7
#             T989UVLE1 I757MUGMC5 SC05DOMMSG SC05DOMMSI
echo "Searching radio image for version..."
RADIO_VERSION=`strings $IMAGE_TO_CHECK | grep -E ^$RADIO_MODEL[A-Z]{4,5}[A-Z1-9]$ -m 1`
if [ "$RADIO_VERSION" == "" ]; then
    ui_print "ERROR: Could not determine the radio version."
    rm $IMAGE_TO_CHECK
    exit 1
fi
ui_print "Found radio version: $RADIO_VERSION"
rm $IMAGE_TO_CHECK

# Iterate through the possible model/minversion pairs
#   - compare to the specified minversion
MINVERSIONS_FOR_THIS_MODEL=""
for PAIR in "$@"; do
    MODEL=`echo $PAIR | cut -d : -f 1`
    MINVERSION=`echo $PAIR | cut -d : -f 2`
    if [ "$MODEL" == "$RADIO_MODEL" ]; then
        echo "Model matched! MODEL=$MODEL MINVERSION=$MINVERSION"
        COMPARE_VERSION="$MODEL$MINVERSION"
        if [ "$MINVERSIONS_FOR_THIS_MODEL" == "" ]; then
            MINVERSIONS_FOR_THIS_MODEL="$MINVERSION"
        else
            MINVERSIONS_FOR_THIS_MODEL="$MINVERSIONS_FOR_THIS_MODEL $MINVERSION"
        fi
        echo "-- 1: $COMPARE_VERSION"
        echo "-- 2: $MINVERSIONS_FOR_THIS_MODEL"
        if [ ${#COMPARE_VERSION} -eq ${#RADIO_VERSION} ]; then
            echo "-- version lengths matched"
            if [ "$RADIO_VERSION" \< "$MODEL$MINVERSION" ]; then
                ui_print "ERROR: Radio must be newer than $MINVERSION"
                exit 1
            fi
            ui_print "Radio is new enough, continuing install..."
            exit 0
        fi
    fi
done

# The version of the installed radio can be of a format that we don't
# recognize (i.e. different number of characters). In this case, error
# to the user and tell them to notify the maintainer.
if [ "$MINVERSIONS_FOR_THIS_MODEL" != "" ]; then
    ui_print "ERROR: It looks like your radio's version"
    ui_print "is unknown to this script. If you know this"
    ui_print "to be a working radio, please ask your"
    ui_print "maintainer to update the version whitelist!"
    ui_print "Your version: $RADIO_VERSION"
    ui_print "Known good versions:"
    for VERSION in "$MINVERSIONS_FOR_THIS_MODEL"; do
        ui_print "  $RADIO_MODEL$VERSION"
    done
    exit 1
fi

# For the radio installed, there is no minimum version defined by the
# recovery script. Warn, but allow the install.
ui_print "WARNING: No minimum version defined for $RADIO_MODEL."
ui_print "MAKE SURE YOUR RADIO IS JELLYBEAN OR NEWER!"
exit 0

