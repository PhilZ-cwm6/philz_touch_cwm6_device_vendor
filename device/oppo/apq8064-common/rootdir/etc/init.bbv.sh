#!/system/bin/sh

# No path is set up at this point so we have to do it here.
PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

setprop gsm.version.baseband `strings /firmware/image/dsp2.mbn  | grep -B1 "^M9615" | head -1`

