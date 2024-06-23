#!/bin/zsh

###
# Script to place the minertimer files where they belong and to give appropriate permissions etc
# The script needs to be run from an Administrator account with Administrator privileges using SUDO
# Copyright Soferio Pty Ltd
###

# Step 1: Remove Minertime script w

rm /Users/Shared/minertimer/minertimer.sh

# Step 2: Remove PLIST file 

rm /Library/LaunchDaemons/com.soferio.minertimer_daily_timer.plist

# Step 3: Unregister the minertimer as a background task

launchctl bootout system/com.soferio.minertimer_daily_timer

# Step 4: Remove log file
rm /var/lib/minertimer/minertimer_playtime.log

# Step 5: Report
echo ""
echo "Script has been run. Assuming there are no errors, to check if the minertimer ackground process is running type the following:"
echo "sudo launchctl list | grep com.soferio.minertimer_daily_timer"
echo "If you get nothing, it means the background process is no longer running and minecraft is not limited."




# TO CHECK IF SCRIPT IS RUNNING:
# sudo launchctl list | grep soferio

