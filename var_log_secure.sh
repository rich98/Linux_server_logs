#!/bin/bash

# Check if the OS is Red Hat 9.x
OS=$(cat /etc/redhat-release)
if [[ "$OS" != *"Red Hat Enterprise Linux release 9."* ]]; then
    echo "This script can only be run on Red Hat Enterprise Linux 9.x."
    exit 1
fi

# Get the server name
SERVER_NAME=$(hostname)

# Get the current date
DATE=$(date +%Y-%m-%d)

# Define the log file location
LOG_FILE="/var/log/secure"

# Define the output file name
OUTPUT_FILE="${SERVER_NAME}_logs_${DATE}.txt"

# Check if the log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "The log file $LOG_FILE does not exist."
    exit 1
fi

# Write the OS details to the output file
echo "Hostname:$SERVER_NAME OS Details:$OS" > $OUTPUT_FILE

# Extract the logs and append them to the output file
awk '{print $1" "$2" "$3": "$5" "$6" "$7" "$8" "$9" "$10}' $LOG_FILE >> $OUTPUT_FILE

echo "The logs have been extracted to $OUTPUT_FILE"





