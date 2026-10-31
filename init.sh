#!/usr/bin/env bash

# Check if argument is provided
if [ "$#" -lt 1 ] || [ -z "${1:-}" ]; then
    echo "Usage: $0 <project_name>"
    echo "Example: $0 MyProject"
    exit 1
fi

PROJECT_NAME="$1"

# Define the files to process (modify this list as needed)
FILES=(
    CMakeLists.txt
    run_debug.sh
    run_release.sh
)

echo "Replacing @@@PROJECT_NAME@@@ with \"$PROJECT_NAME\" in the following files:"

COUNT=0
for f in "${FILES[@]}"; do
    if [ -f "$f" ]; then
        echo "Processing: $f"
        # Escape sed replacement metacharacters (&, /, \, newline) in the project name
        ESCAPED_NAME=$(printf '%s' "$PROJECT_NAME" | sed -e 's/[&/\]/\\&/g')
        sed -i "s/@@@PROJECT_NAME@@@/${ESCAPED_NAME}/g" "$f"
        COUNT=$((COUNT + 1))
    else
        echo "[SKIP] $f (file not found)"
    fi
done

echo "Completed! Processed $COUNT file(s)."
echo

if [ -d .git ]; then
    echo "Removing existing .git directory..."
    rm -rf .git
fi

echo "Initializing new Git repository..."
git init

echo "Cleaning up and deleting this script..."
rm -f "$0"
