#!/bin/bash

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file1> <file2>"
    exit 1
fi

# Input files
FILE1="$1"
FILE2="$2"

# Output file for differences
DIFF_OUTPUT="differences.txt"

# Compare files and store the differences
diff "$FILE1" "$FILE2" > "$DIFF_OUTPUT"

# Check if differences were found
if [ -s "$DIFF_OUTPUT" ]; then
    echo "Differences found and stored in $DIFF_OUTPUT."
else
    echo "No differences found between $FILE1 and $FILE2."
    rm "$DIFF_OUTPUT"  # Remove the output file if it's empty
fi
