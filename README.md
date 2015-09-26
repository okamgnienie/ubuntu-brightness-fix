ubuntu-fix-brightness
=====================
My solution for problems with reseting brightness
on ubuntu boot-up and wake-up from suspension.

After installation on each brightness change, new value is saved and
restored on every wake-up from sleep and system boot-up.

## Configuration:
In all commands presented in readme and in each script change USERNAME to you username.

1. Install inotifywait
    ```bash
    $ sudo apt-get install inotify-tools
    ```

2. Check you devices:
    Comand will display folders and you will need to change the script referng to above log.
    ```bash
    $ ls /sys/class/backlight
    ```

    Example output:
    ```bash
    $ ls /sys/class/backlight
    acpi_video0  acpi_video1  intel_backlight  nv_backlight
    ```
    I've skipped nv_backlight in scripts because value here is not changing.

4. Add to /usr/lib/pm-utils/sleep.d/95led in the 'resume' section
    ```bash
    # Fix brightness:
    exec /home/USERNAME/.fix_brightness/./restore-brightness.sh
    ```
    This will restore brightness on system startup.

5. Add to /etc/rc.local	line before exit 0
    ```bash
    exec /home/USERNAME/.fix_brightness/./restore-brightness.sh
    ```
    This will restore brightness on wake-up from suspension.

6. Add task to cron:
    Type in terminal:
    ```bash
    $ crontab -e
    ```

    Add following line to the end of buffer:
    ```bash
    @reboot nohup /home/USERNAME/.fix_brightness/save-brightness.sh &>/dev/null &
    ```
