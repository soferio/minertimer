### DEVELOPER NOTES

# TODOS/Next steps
- Maybe expand to cover other Java games?
- Better packaging for less sophisticated users?

## List of directories and their purposes
- Location of .sh script: /Users/Shared/minertimer
- Location of .plist: /Library/LaunchDaemons
- Location of error messages etc: std output.
- Location of timekeeping LOG_FILE: /var/lib/minertimer/minertimer_playtime.log 

## Useful commands:

# To check if script is running (good to check if it is running for other users)
- sudo launchctl list | grep com.soferio.minertimer_daily_timer

# To stop script:
- sudo launchctl unload /Library/LaunchAgents/com.soferio.minertimer_daily_timer.plist
