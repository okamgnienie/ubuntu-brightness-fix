#!/bin/bash

# Get data from file:
video0=`sed -n '1p' /home/przemyslaw/.fix_brightness/saved_brightness`
video1=`sed -n '2p' /home/przemyslaw/.fix_brightness/saved_brightness`
intel=`sed -n '3p' /home/przemyslaw/.fix_brightness/saved_brightness`

# Apply changes to acpi_video0:
echo $video0 > /sys/class/backlight/acpi_video0/brightness
echo $video0 > /sys/class/backlight/acpi_video0/actual_brightness

# Apply changes to acpi_video1:
echo $video1 > /sys/class/backlight/acpi_video1/brightness
echo $video1 > /sys/class/backlight/acpi_video1/actual_brightness

# Apply changes to intel_backlight:
echo $intel > /sys/class/backlight/intel_backlight/brightness
echo $intel > /sys/class/backlight/intel_backlight/actual_brightness

exit 0
