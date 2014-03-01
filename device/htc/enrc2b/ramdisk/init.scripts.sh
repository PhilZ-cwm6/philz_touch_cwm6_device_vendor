#!/system/bin/sh

# any kernel init configs go here

LOG_FILE=/data/local/init.scripts.log
if [ -e $LOG_FILE ]; then
    rm $LOG_FILE
fi

echo "Starting init.scripts.sh $( date +"%m-%d-%Y %H:%M:%S" )" | tee -a $LOG_FILE

# need to enable all CPU cores in order to set them up
echo 4 > /sys/kernel/debug/tegra_hotplug/min_cpus
sleep 3
# set governors
echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "ondemand" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo "ondemand" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo "ondemand" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor

# set default speeds (cpus activate in order 0-3-2-1)
echo "1300000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo "1600000" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
echo "1500000" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
echo "1400000" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq

echo "51000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo "51000" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
echo "51000" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
echo "51000" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq

sync 

echo "govenor" | tee -a $LOG_FILE
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor | tee -a $LOG_FILE
cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor | tee -a $LOG_FILE
cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor | tee -a $LOG_FILE
cat /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor | tee -a $LOG_FILE

echo "scaling_max_freq" | tee -a $LOG_FILE
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq | tee -a $LOG_FILE
cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq | tee -a $LOG_FILE
cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq | tee -a $LOG_FILE
cat /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq | tee -a $LOG_FILE

echo "scaling_min_freq" | tee -a $LOG_FILE
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq | tee -a $LOG_FILE
cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq | tee -a $LOG_FILE
cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq | tee -a $LOG_FILE
cat /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq | tee -a $LOG_FILE

# reset core activation to default
echo 0 > /sys/kernel/debug/tegra_hotplug/min_cpus

# set ondemand prefs
echo "15" > /sys/devices/system/cpu/cpufreq/ondemand/down_differential
echo "1" > /sys/devices/system/cpu/cpufreq/ondemand/ignore_nice_load
echo "3000000" > /sys/devices/system/cpu/cpufreq/ondemand/input_boost_duration
echo "1" > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
echo "5" > /sys/devices/system/cpu/cpufreq/ondemand/powersave_bias
echo "5" > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
echo "30000" > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
echo "10000" > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate_min
echo "1" > /sys/devices/system/cpu/cpufreq/ondemand/touch_poke
echo "51000" > /sys/devices/system/cpu/cpufreq/ondemand/two_phase_bottom_freq
echo "1" > /sys/devices/system/cpu/cpufreq/ondemand/two_phase_dynamic
echo "340000" > /sys/devices/system/cpu/cpufreq/ondemand/two_phase_freq
echo "3" > /sys/devices/system/cpu/cpufreq/ondemand/ui_counter
echo "20000" > /sys/devices/system/cpu/cpufreq/ondemand/ui_sampling_rate
echo "80" > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
echo "66" > /sys/devices/system/cpu/cpufreq/ondemand/ux_boost_threshold
echo "760000" > /sys/devices/system/cpu/cpufreq/ondemand/ux_freq
echo "20" > /sys/devices/system/cpu/cpufreq/ondemand/ux_loading

echo "Finished init.scripts.sh $( date +"%m-%d-%Y %H:%M:%S" )" | tee -a $LOG_FILE
