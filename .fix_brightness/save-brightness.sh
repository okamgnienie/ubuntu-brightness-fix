#!/bin/bash

while inotifywait /sys/class/backlight/acpi_video0/actual_brightness; do
    # save acpi_video0 brightness
    video0=`cat /sys/class/backlight/acpi_video0/actual_brightness`
    echo $video0 > /home/przemyslaw/.fix_brightness/saved_brightness

    # save acpi_video1 brightness
    video1=`cat /sys/class/backlight/acpi_video1/actual_brightness`
    echo $video1 >> /home/przemyslaw/.fix_brightness/saved_brightness

    # save intel_backlight brightness
    intel=`cat /sys/class/backlight/intel_backlight/actual_brightness`
    echo $intel >> /home/przemyslaw/.fix_brightness/saved_brightness
done
