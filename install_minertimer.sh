#!/bin/zsh

###
# Script to place the minertimer files where they belong and to give appropriate permissions etc
# The script needs to be run from an Administrator account with Administrator privileges
# Copyright Soferio Pty Ltd
###

# Step 1: Place Minertime script where it belongs (and create directory if necessary)

mkdir -p /Users/Shared/minertimer
cp minertimer.sh /Users/Shared/minertimer/
chmod +x /Users/Shared/minertimer/minertimer.sh

# Step 2: Place the PLIST file where it belongs

cp com.soferio.minertimer_daily_timer.plist /Library/LaunchDaemons/
chown root:wheel /Library/LaunchDaemons/com.soferio.minertimer_daily_timer.plist
chmod 644 /Library/LaunchDaemons/com.soferio.minertimer_daily_timer.plist

# Step 3: Register the minertimer as a background task

launchctl load -w /Library/LaunchDaemons/com.soferio.minertimer_daily_timer.plist

# Step 4: Post Script report
echo ""
echo "Script has been run. Assuming there are no errors, to check if the minertimer ackground process is running type the following:"
echo "sudo launchctl list | grep com.soferio.minertimer_daily_timer"
echo "If you get a line of text commencing with a process number, it means the script is running."

# NOTES POST INSTALLATION

# TO STOP SCRIPT RUNNING, you use this command:
# sudo launchctl unload /Library/LaunchDaemons/com.soferio.minertimer_daily_timer.plist

# TO CHECK IF SCRIPT IS RUNNING:
# sudo launchctl list | grep com.soferio.minertimer_daily_timer


