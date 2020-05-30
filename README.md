# scripts

this is my collection of linux scripts. contains bash shell scripts, a python script is planned

# brightnessControl.sh:

Allows in-/decreasing brightness by 5:      
```bash
$ ./brightnessControl.sh up       
```
```bash
$ ./brightnessControl.sh down      
```
Sends a low priority notification to your notification daemon.      
The notification contains:      
- an icon showing a lightbulb in different states      
- a progressbar displaying the brightness      
- brightness in percentage     
      
- required: xbacklight, notify-send, elementary-xfce iconset      

# volumeControl.sh:
      
Allows in-/decreasing brightness by 5:   
```bash
$ ./volumeControl.sh up      
```
```bash
$ ./volumeControl.sh down      
```
Sends a low priority notification to your notification daemon.      
It contains:      
- an icon showing a speaker in different states      
- a progressbar for the current volume      
- current vol in percent      
      
- required: amixer, notify-send, elementary-xfce     

# crontab/batterystate.sh

A script for checking the batterystate.
If the battery is running low and your device
is not getting charged, it sends a high priority notification 
to your notification daemon.
It contains a label and a bar displaying 
the battery percentage.
Best used as a cronjob. To display the notification to the monitor,
it connects to the DBUS.
Add the following to your crontab:
```bash
SHELL=/bin/sh
MAILTO=[your username]
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# executed every minute
* * * * * /.scripts/crontab/batterystate.sh
```
-requires upower

