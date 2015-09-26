#!/bin/bash
cd "$(dirname "$0")"

# Update all values:
path=`find /sys/class/backlight/*`

# Add devices to array:
devices=()

for file in $path; do
    devices+=("$file")
done

# For each device get stored value and save it to proper file:
for i in "${!devices[@]}"; do
    # Get stored value for the current device:
    value=`sed -n $(($i+1))'p' saved_brightness`

    # Save stored value to the system files:
    echo $value > "${devices[$i]}/brightness"
    echo $value > "${devices[$i]}/actual_brightness"
done

exit 0
