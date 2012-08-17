#!/system/bin/sh
#
#The Kuban ExTweaks Profile Script
#
#Created by RUJELUS22

LOG_FILE=/data/exprofile.log
if [ -e $LOG_FILE ]; then
	rm $LOG_FILE;
fi;
BATTERY_LEVEL=`cat /sys/class/power_supply/battery/capacity`
CHARCHING=`cat /sys/class/power_supply/battery/status`

source "/data/.kuban/default.profile"

echo "EX Profile Script Started at $( date +"%m-%d-%Y %H:%M:%S" )" | tee -a $LOG_FILE;
echo "" | tee -a $LOG_FILE;

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
				echo "*************************" | tee -a $LOG_FILE;
				echo "Discharging Profile" | tee -a $LOG_FILE;
				echo "" | tee -a $LOG_FILE;
				echo "*************************" | tee -a $LOG_FILE;
				if [ $BATTERY_LEVEL -le $lowbatt ];
				then
					BATTERY_LEVEL=`cat /sys/class/power_supply/battery/capacity`
					source "/data/.kuban/default.profile"
					echo "*************************" | tee -a $LOG_FILE;
					echo "Screen On Low Battery Profile Started" | tee -a $LOG_FILE;
					echo "" | tee -a $LOG_FILE;
					echo "Settings:" | tee -a $LOG_FILE;
					echo "Governor: $scaling_governor_batt" | tee -a $LOG_FILE;
					echo "Max Freq: $scaling_max_freq_batt" | tee -a $LOG_FILE;
					echo "Min Freq: $scaling_min_freq_batt" | tee -a $LOG_FILE;
					echo "" | tee -a $LOG_FILE;
					echo $scaling_governor_batt > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
					echo $scaling_max_freq_batt > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
					echo $scaling_min_freq_batt > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
				fi
				if [ $BATTERY_LEVEL -gt $lowbatt ];
				then
					BATTERY_LEVEL=`cat /sys/class/power_supply/battery/capacity`
					source "/data/.kuban/default.profile"
					echo "*************************" | tee -a $LOG_FILE;
					echo "Screen On Normal Battery Profile Started" | tee -a $LOG_FILE;
					echo "" | tee -a $LOG_FILE;
					echo "Settings:" | tee -a $LOG_FILE;
					echo "Governor: $scaling_governor" | tee -a $LOG_FILE;
					echo "Max Freq: $scaling_max_freq" | tee -a $LOG_FILE;
					echo "Min Freq: $scaling_min_freq" | tee -a $LOG_FILE;
					echo "" | tee -a $LOG_FILE;
					echo $scaling_governor > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
					echo $scaling_max_freq > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
					echo $scaling_min_freq > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
				fi
			fi
			CHARCHING=`cat /sys/class/power_supply/battery/status`
			if [ $CHARCHING = Charging ];
			then
				echo "*************************" | tee -a $LOG_FILE;
				echo "Charging Profile" | tee -a $LOG_FILE;
				echo "" | tee -a $LOG_FILE;
				echo "*************************" | tee -a $LOG_FILE;
				if [ $BATTERY_LEVEL -le $lowbatt ];
				then
					BATTERY_LEVEL=`cat /sys/class/power_supply/battery/capacity`
					source "/data/.kuban/default.profile"
					echo "*************************" | tee -a $LOG_FILE;
					echo "Screen On Low Battery Profile Started" | tee -a $LOG_FILE;
					echo "" | tee -a $LOG_FILE;
					echo "Settings:" | tee -a $LOG_FILE;
					echo "Governor: $scaling_governor_charging" | tee -a $LOG_FILE;
					echo "Max Freq: $scaling_max_freq_charging" | tee -a $LOG_FILE;
					echo "Min Freq: $scaling_min_freq_charging" | tee -a $LOG_FILE;
					echo "" | tee -a $LOG_FILE;
					echo $scaling_governor_charging > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
					echo $scaling_max_freq_charging > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
					echo $scaling_min_freq_charging > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
				fi
				if [ $BATTERY_LEVEL -gt $lowbatt ];
				then
					BATTERY_LEVEL=`cat /sys/class/power_supply/battery/capacity`
					source "/data/.kuban/default.profile"
					echo "*************************" | tee -a $LOG_FILE;
					echo "Screen On Normal Battery Profile Started" | tee -a $LOG_FILE;
					echo "" | tee -a $LOG_FILE;
					echo "Settings:" | tee -a $LOG_FILE;
					echo "Governor: $scaling_governor_charging" | tee -a $LOG_FILE;
					echo "Max Freq: $scaling_max_freq_charging" | tee -a $LOG_FILE;
					echo "Min Freq: $scaling_min_freq_charging" | tee -a $LOG_FILE;
					echo "" | tee -a $LOG_FILE;
					echo $scaling_governor_charging > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
					echo $scaling_max_freq_charging > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
					echo $scaling_min_freq_charging > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
				fi
			fi
		fi
		if [ $enabled = 0 ]
		then
			BATTERY_LEVEL=`cat /sys/class/power_supply/battery/capacity`
			source "/data/.kuban/default.profile"
			echo "*************************" | tee -a $LOG_FILE;
			echo "Screen On Profiles not enabled" | tee -a $LOG_FILE;
			echo "" | tee -a $LOG_FILE;
		fi
	AWAKE=	
	fi
	SLEEPING=`cat /sys/power/wait_for_fb_sleep`
	if [ $SLEEPING = "sleeping" ]; 
	then
		if [ $enabled = 1 ]
		then
			BATTERY_LEVEL=`cat /sys/class/power_supply/battery/capacity`
			source "/data/.kuban/default.profile"
			CHARCHING=`cat /sys/class/power_supply/battery/status`
			if [ $CHARCHING = Discharging ];
			then
				echo "*************************" | tee -a $LOG_FILE;
				echo "Discharging Profile" | tee -a $LOG_FILE;
				echo "" | tee -a $LOG_FILE;
				echo "*************************" | tee -a $LOG_FILE;
				if [ $BATTERY_LEVEL -le $lowbatt ];
				then
					BATTERY_LEVEL=`cat /sys/class/power_supply/battery/capacity`
					source "/data/.kuban/default.profile"
					echo "*************************" | tee -a $LOG_FILE;
					echo "Screen Off Profile Started" | tee -a $LOG_FILE;
					echo "" | tee -a $LOG_FILE;
					echo "Settings:" | tee -a $LOG_FILE;
					echo "Governor: $scaling_governor_sleep" | tee -a $LOG_FILE;
					echo "Max Freq: $scaling_max_freq_sleep" | tee -a $LOG_FILE;
					echo "Min Freq: $scaling_min_freq_sleep" | tee -a $LOG_FILE;
					echo "" | tee -a $LOG_FILE;
					echo $scaling_governor_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
					echo $scaling_max_freq_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
					echo $scaling_min_freq_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
				fi
				if [ $BATTERY_LEVEL -gt $lowbatt ];
				then
					BATTERY_LEVEL=`cat /sys/class/power_supply/battery/capacity`
					source "/data/.kuban/default.profile"
					echo "*************************" | tee -a $LOG_FILE;
					echo "Screen Off Profile Started" | tee -a $LOG_FILE;
					echo "" | tee -a $LOG_FILE;
					echo "Settings:" | tee -a $LOG_FILE;
					echo "Governor: $scaling_governor_sleep" | tee -a $LOG_FILE;
					echo "Max Freq: $scaling_max_freq_sleep" | tee -a $LOG_FILE;
					echo "Min Freq: $scaling_min_freq_sleep" | tee -a $LOG_FILE;
					echo "" | tee -a $LOG_FILE;
					echo $scaling_governor_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
					echo $scaling_max_freq_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
					echo $scaling_min_freq_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
				fi
			fi
			CHARCHING=`cat /sys/class/power_supply/battery/status`
			if [ $CHARCHING = Charging ];
			then
				echo "*************************" | tee -a $LOG_FILE;
				echo "Charging Profile" | tee -a $LOG_FILE;
				echo "" | tee -a $LOG_FILE;
				echo "*************************" | tee -a $LOG_FILE;
				if [ $BATTERY_LEVEL -le $lowbatt ];
				then
					BATTERY_LEVEL=`cat /sys/class/power_supply/battery/capacity`
					source "/data/.kuban/default.profile"
					echo "*************************" | tee -a $LOG_FILE;
					echo "Screen Off Profile Started" | tee -a $LOG_FILE;
					echo "" | tee -a $LOG_FILE;
					echo "Settings:" | tee -a $LOG_FILE;
					echo "Governor: $scaling_governor_sleep" | tee -a $LOG_FILE;
					echo "Max Freq: $scaling_max_freq_sleep" | tee -a $LOG_FILE;
					echo "Min Freq: $scaling_min_freq_sleep" | tee -a $LOG_FILE;
					echo "" | tee -a $LOG_FILE;
					echo $scaling_governor_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
					echo $scaling_max_freq_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
					echo $scaling_min_freq_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
				fi
				if [ $BATTERY_LEVEL -gt $lowbatt ];
				then
					BATTERY_LEVEL=`cat /sys/class/power_supply/battery/capacity`
					source "/data/.kuban/default.profile"
					echo "*************************" | tee -a $LOG_FILE;
					echo "Screen Off Profile Started" | tee -a $LOG_FILE;
					echo "" | tee -a $LOG_FILE;
					echo "Settings:" | tee -a $LOG_FILE;
					echo "Governor: $scaling_governor_sleep" | tee -a $LOG_FILE;
					echo "Max Freq: $scaling_max_freq_sleep" | tee -a $LOG_FILE;
					echo "Min Freq: $scaling_min_freq_sleep" | tee -a $LOG_FILE;
					echo "" | tee -a $LOG_FILE;
					echo $scaling_governor_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
					echo $scaling_max_freq_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
					echo $scaling_min_freq_sleep > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
				fi
			fi
		fi
		if [ $enabled = 0 ]
		then
			BATTERY_LEVEL=`cat /sys/class/power_supply/battery/capacity`
			source "/data/.kuban/default.profile"
			echo "*************************" | tee -a $LOG_FILE;
			echo "Screen Off Profiles not enabled" | tee -a $LOG_FILE;
			echo "" | tee -a $LOG_FILE;
		fi
	SLEEPING=
    fi    
done &)
