#!/bin/bash

# Set the threshold percentage for usage (e.g., 80 for 80%)
THRESHOLD=80

# Specify the filesystem to monitor (e.g., / or /home)
FILESYSTEM="/"

# Get the current usage percentage of the specified filesystem
USAGE=$(df -h "$FILESYSTEM" | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage exceeds the threshold
if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "Warning: Filesystem $FILESYSTEM usage is at ${USAGE}%, which exceeds the threshold of ${THRESHOLD}%."
    # Optionally, you can send an alert (e.g., email or log)
    # For example, using mail command (make sure to configure mail)
    # echo "Filesystem $FILESYSTEM usage is at ${USAGE}%." | mail -s "Filesystem Alert" you@example.com
else
    echo "Filesystem $FILESYSTEM usage is at ${USAGE}%, which is within the safe limit."
fi
