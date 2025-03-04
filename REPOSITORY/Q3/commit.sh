#!/bin/bash

# Path to the Excel (CSV) file (update this to your actual file path)
EXCEL_FILE="./bug_details.csv"

# Get the current branch name
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Get the current date and time
CURRENT_DATE_TIME=$(date "+%Y-%m-%d %H:%M:%S")

# Function to extract details from the Excel (CSV) file based on the branch name
get_commit_details() {
    # Extract the row where the branch matches the current branch
    DETAILS=$(grep "$CURRENT_BRANCH" "$EXCEL_FILE" | head -n 1)
    
    if [[ -z "$DETAILS" ]]; then
        echo "Error: No matching entry found for branch $CURRENT_BRANCH in the Excel file."
        exit 1
    fi

    # Extract individual fields from the CSV line
    BUGID=$(echo "$DETAILS" | cut -d, -f1)
    BRANCH=$(echo "$DETAILS" | cut -d, -f2)
    DEVNAME=$(echo "$DETAILS" | cut -d, -f3)
    PRIORITY=$(echo "$DETAILS" | cut -d, -f4)
    DESCRIPTION=$(echo "$DETAILS" | cut -d, -f5)
    
    # Format the commit message
    COMMIT_MESSAGE="$BUGID:$CURRENT_DATE_TIME:$BRANCH:$DEVNAME:$PRIORITY:$DESCRIPTION"
    echo "$COMMIT_MESSAGE"
}

# Get the commit description
COMMIT_MESSAGE=$(get_commit_details)

# Stage all the changes (you can modify this to add specific files if necessary)
git add .

# Commit with the generated commit message
git commit -m "$COMMIT_MESSAGE"

# Push the changes to GitHub
git push origin "$CURRENT_BRANCH"

echo "Commit successfully made and pushed with message: $COMMIT_MESSAGE"

