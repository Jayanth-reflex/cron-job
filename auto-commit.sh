#!/usr/bin/env bash

# Exit on error
set -e

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Navigate to repo directory
cd "$SCRIPT_DIR"

# Log the execution
echo "$(date '+%Y-%m-%d %H:%M:%S') - Starting automated commit" >> auto-commit.log

# Update file with current date/time
echo "$(date '+%Y-%m-%d %H:%M:%S')" > daily.txt

# Stage changes
git add daily.txt

# Check if there are changes to commit
if git diff --cached --quiet; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - No changes to commit" >> auto-commit.log
    exit 0
fi

# Commit with timestamp in message
git commit -m "Automated commit on $(date '+%Y-%m-%d %H:%M:%S')"

# Push to remote (use current branch instead of hardcoded 'main')
CURRENT_BRANCH=$(git branch --show-current)
git push origin "$CURRENT_BRANCH"

echo "$(date '+%Y-%m-%d %H:%M:%S') - Successfully committed and pushed changes" >> auto-commit.log
