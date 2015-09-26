#!/bin/bash
cd "$(dirname "$0")"

# Save values on each brightness change.
while inotifywait /sys/class/backlight/acpi_video0/actual_brightness; do
    # Remove current values:
    > saved_brightness

    # Update all values:
    for element in `find /sys/class/backlight/*`
    do
        currentValue=`cat $element/actual_brightness`
        echo $currentValue >> saved_brightness
    done
done
