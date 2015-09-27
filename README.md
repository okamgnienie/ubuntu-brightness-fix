ubuntu-brightness-fix
=====================
My solution to the problem of resetting the brightness of the screen
at startup and wake from suspension on ubuntu.

After setup, each time you change the brightness value is stored in the file
'saved\_brightness'. During the system startup and wake from sleep value
is restored using the script 'restore\_brightness.sh'. Script 'save_brightness.sh' runs in the background monitoring and recording the changes in the brightness of the screen.

## Configuration:

In all commands below change USERNAME to you system username.

### 1. Install inotify-tools:

    ```bash
    $ sudo apt-get install inotify-tools
    ```

### 2. Copy .fix_brightness to your home directory.

### 3. Apply brightness fix for the system wake up.

    Open file:
    ```bash
    $ sudo nano /usr/lib/pm-utils/sleep.d/95led
    ```

    Add this line in the 'resume' section:
    ```bash
    # Fix brightness:
    nohup /home/USERNAME/.fix_brightness/restore-brightness.sh &>/dev/null &
    ```

### 4. Apply brightness fix for the system start.

    Open file:
    ```bash
    $ sudo nano /etc/rc.local
    ```

    Add this code line before 'exit 0':
    ```bash
    # Fix brightness:
    nohup /home/USERNAME/.fix_brightness/restore-brightness.sh &>/dev/null &
    ```

### 5. Add task to cron:

    Open cron:
    ```bash
    $ crontab -e
    ```

    Add following line to the end of buffer:
    ```bash
    @reboot nohup /home/USERNAME/.fix_brightness/save-brightness.sh &>/dev/null &
    ```

### 6. Now reboot your system and enjoy!
