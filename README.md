ubuntu-brightness-fix
=====================
My solution for problem with reseting brightness
on ubuntu boot-up and wake-up from suspension.

After configuration, on each brightness change new value is saved and
restored on every wake-up and start-up.

## Configuration:
In all commands below change USERNAME to you system username.

1. Install inotify-tools:
    ```bash
    $ sudo apt-get install inotify-tools
    ```

2. Copy .fix_brightness to your home.

3. Apply brightness fix for system start-up.

    Open file:
    ```bash
    $ sudo nano /usr/lib/pm-utils/sleep.d/95led
    ```

    Add this line in the 'resume' section:
    ```bash
    # Fix brightness:
    nohup /home/USERNAME/.fix_brightness/restore-brightness.sh &>/dev/null &
    ```

4. Apply brightness fix for system wake-up.

    Open file:
    ```bash
    $ sudo nano /etc/rc.local
    ```

    ```bash
    # Fix brightness:
    nohup /home/USERNAME/.fix_brightness/restore-brightness.sh &>/dev/null &
    ```

5. Add task to cron:
    ```bash
    $ crontab -e
    ```

    Add following line to the end of buffer:
    ```bash
    @reboot nohup /home/USERNAME/.fix_brightness/save-brightness.sh &>/dev/null &
    ```

6. Now reboot your system and enjoy!
