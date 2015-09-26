ubuntu-brightness-fix
=====================
My solution for problem with reseting brightness
on ubuntu boot-up and wake-up from suspension.

After configuration, on each brightness change new value is saved and
restored on every wake-up from sleep and system boot-up.

## Configuration:
In all commands change USERNAME to you system username.

1. Install inotify-tools:
    ```bash
    $ sudo apt-get install inotify-tools
    ```

2. Add to /usr/lib/pm-utils/sleep.d/95led in the 'resume' section
    ```bash
    # Fix brightness:
    nohup /home/USERNAME/.fix_brightness/restore-brightness.sh &>/dev/null &
    ```
    This will restore brightness on system startup.

3. Add to /etc/rc.local	line before exit 0
    ```bash
    # Fix brightness:
    nohup /home/USERNAME/.fix_brightness/restore-brightness.sh &>/dev/null &
    ```
    This will restore brightness on wake-up from suspension.

4. Add task to cron:
    ```bash
    $ crontab -e
    ```

    Add following line to the end of buffer:
    ```bash
    @reboot nohup /home/USERNAME/.fix_brightness/save-brightness.sh &>/dev/null &
    ```

5. Now reboot your system and enjoy!
