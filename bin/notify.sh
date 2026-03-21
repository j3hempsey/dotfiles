#!/bin/bash

# Join all arguments into a single string command
COMMAND="$*"

# Execute the string as a bash command
eval "$COMMAND"

# Capture the exit status
EXIT_STATUS=$?

# Send notification based on result
if [ $EXIT_STATUS -eq 0 ]; then
    notify-send -i terminal "Pipeline Success" "Completed: $COMMAND"
else
    notify-send -u critical -i error "Pipeline Failed" "Error ($EXIT_STATUS) in: $COMMAND"
fi
