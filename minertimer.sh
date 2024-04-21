#!/bin/zsh

###
# Core MINERTIMER script. Kills minecraft Java edition on MacOS after 30 min.
# Developed and owned by Soferio Pty Limited.
###

# Time limit in seconds (e.g., 1800 for half an hour)
TIME_LIMIT=1800
WEEKEND_TIME_LIMIT=3600
DISPLAY_5_MIN_WARNING=true
DISPLAY_1_MIN_WARNING=true

# Directory and file to store total played time for the day
LOG_DIRECTORY="/var/lib/minertimer"
LOG_FILE="${LOG_DIRECTORY}/minertimer_playtime.log"

# Create the directory (don't throw error if already exists)
mkdir -p $LOG_DIRECTORY

# Get the current date
CURRENT_DATE=$(date +%Y-%m-%d)

# Read the last play date and total played time from the log file
if [ -f "$LOG_FILE" ]; then
    LAST_PLAY_DATE=$(head -n 1 "$LOG_FILE")
    TOTAL_PLAYED_TIME=$(tail -n 1 "$LOG_FILE")
else
    LAST_PLAY_DATE="$CURRENT_DATE"
    TOTAL_PLAYED_TIME=0
    echo "$CURRENT_DATE" > "$LOG_FILE"
    echo "0" >> "$LOG_FILE"
fi

 # If it's a new day, or first use, reset the playtime
if [ "$LAST_PLAY_DATE" != "$CURRENT_DATE" ]; then
    TOTAL_PLAYED_TIME=0
    echo "$CURRENT_DATE" > "$LOG_FILE"
    echo "0" >> "$LOG_FILE"
fi

while true; do
    
    MINECRAFT_PIDS=$(ps aux | grep -iww "[M]inecraft" | awk '{print $2}')
    # If Minecraft is running
    
    if [ -n "$MINECRAFT_PIDS" ]; then
        current_limit=TIME_LIMIT
        if [[ $(date +%u) -gt 5 ]]; then
            current_limit=WEEKEND_TIME_LIMIT
        fi
        # If the time limit has been reached, kill the Minecraft process
        if ((TOTAL_PLAYED_TIME >= current_limit)); then
            echo $MINECRAFT_PIDS | xargs kill
            echo "Minecraft has been closed after reaching the daily time limit."
            osascript -e 'display notification "Minecraft time expired" with title "Minecraft Closed"'
            afplay /System/Library/Sounds/Glass.aiff 
        elif ((TOTAL_PLAYED_TIME >= current_limit - 300)) && [ "$DISPLAY_5_MIN_WARNING" = true ]; then
            osascript -e 'display notification "Minecraft will exit in 5 minutes" with title "Minecraft Time Expiring Soon"'
            say "Minecraft time will expire in 5 minutes"
            DISPLAY_5_MIN_WARNING=false
        elif ((TOTAL_PLAYED_TIME >= current_limit - 60)) && [ "$DISPLAY_1_MIN_WARNING" = true ]; then
            osascript -e 'display notification "Minecraft will exit in 1 minute" with title "Minecraft Time Expiring"'
            say "Minecraft time will expire in 1 minute"
            DISPLAY_1_MIN_WARNING=false
        fi
        
        # Sleep, then increment the playtime
        sleep 20
        TOTAL_PLAYED_TIME=$((TOTAL_PLAYED_TIME + 20))

        # Update the total played time in the log file (Note on mac -i requires extension)
        sed -i '' "$ s/.*/$TOTAL_PLAYED_TIME/" "$LOG_FILE"

    else
        sleep 10
    fi

    # Get the current date
    CURRENT_DATE=$(date +%Y-%m-%d)

    # Read the last play date from the log file
    if [ -f "$LOG_FILE" ]; then
        LAST_PLAY_DATE=$(head -n 1 "$LOG_FILE")
    else
        # This error should not happen because log file created above
        echo "ERROR - NO LOG FILE"
    fi

    # If it's a new day, reset the playtime
    if [ "$LAST_PLAY_DATE" != "$CURRENT_DATE" ]; then
        TOTAL_PLAYED_TIME=0
        DISPLAY_5_MIN_WARNING=true
        DISPLAY_1_MIN_WARNING=true
        echo "$CURRENT_DATE" > "$LOG_FILE"
        echo "0" >> "$LOG_FILE"
        echo "RESET DATE - $CURRENT_DATE"
    fi
done
