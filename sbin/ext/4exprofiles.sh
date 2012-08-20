#!/system/bin/sh
#
#The Kuban ExTweaks Profile Script
#
#Created by RUJELUS22

(while [ 1 ]
do
    AWAKE=`cat /sys/power/wait_for_fb_wake`
	if [ $AWAKE = "awake" ]; 
	then
		BATTERY_LEVEL=`cat /sys/class/power_supply/battery/capacity`
		CHARCHING=`cat /sys/class/power_supply/battery/status`
		source "/data/.kuban/default.profile"
		if [ $enabled = 1 ]
		then
			if [ $CHARCHING = Discharging ];
			then
				if [ $BATTERY_LEVEL -le $lowbatt ];
				then
					echo $scaling_governor_batt > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
					echo $scaling_max_freq_batt > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
					echo $scaling_min_freq_batt > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
				fi
				if [ $BATTERY_LEVEL -gt $lowbatt ];
				then
					echo $scaling_governor > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
					echo $scaling_max_freq > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
					echo $scaling_min_freq > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
				fi
			fi
			if [ $CHARCHING = Charging ];
			then
				if [ $BATTERY_LEVEL -le $lowbatt ];
				then
					echo $scaling_governor_charging > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
					echo $scaling_max_freq_charging > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
					echo $scaling_min_freq_charging > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
				fi
				if [ $BATTERY_LEVEL -gt $lowbatt ];
				then
					echo $scaling_governor_charging > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
					echo $scaling_max_freq_charging > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
					echo $scaling_min_freq_charging > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
				fi
			fi
		fi
		if [ $enabled = 0 ]
		then
			source "/data/.kuban/default.profile"
		fi
	AWAKE=	
	fi
    SLEEPING=`cat /sys/power/wait_for_fb_sleep`
	if [ $SLEEPING = "sleeping" ]; 
	then
		BATTERY_LEVEL=`cat /sys/class/power_supply/battery/capacity`
		CHARCHING=`cat /sys/class/power_supply/battery/status`
		source "/data/.kuban/default.profile"
		if [ $enabled = 1 ]
		then
			if [ $CHARCHING = Discharging ];
			then
				if [ $BATTERY_LEVEL -le $lowbatt ];
				then
					echo $scaling_governor_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
					echo $scaling_max_freq_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
					echo $scaling_min_freq_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
				fi
				if [ $BATTERY_LEVEL -gt $lowbatt ];
				then
					echo $scaling_governor_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
					echo $scaling_max_freq_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
					echo $scaling_min_freq_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
				fi
			fi
			if [ $CHARCHING = Charging ];
			then
				if [ $BATTERY_LEVEL -le $lowbatt ];
				then
					echo $scaling_governor_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
					echo $scaling_max_freq_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
					echo $scaling_min_freq_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
				fi
				if [ $BATTERY_LEVEL -gt $lowbatt ];
				then
					echo $scaling_governor_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
					echo $scaling_max_freq_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
					echo $scaling_min_freq_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
				fi
			fi
		fi
		if [ $enabled = 0 ]
		then
			source "/data/.kuban/default.profile"
		fi
	SLEEPING=
    fi    
done &)
