#!/usr/bin/env bash

# Setup script for cron job automation
echo "🚀 Setting up Cron Job Automation"

# Get the current directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Make the auto-commit script executable
chmod +x "$SCRIPT_DIR/auto-commit.sh"
echo "✅ Made auto-commit.sh executable"

# Test the script
echo "🧪 Testing the automation script..."
if "$SCRIPT_DIR/auto-commit.sh"; then
    echo "✅ Script test successful"
else
    echo "❌ Script test failed"
    exit 1
fi

# Show current crontab
echo "📋 Current crontab entries:"
crontab -l 2>/dev/null || echo "No crontab entries found"

# Ask user for schedule preference
echo ""
echo "📅 Choose your schedule:"
echo "1. Daily at midnight (00:00)"
echo "2. Every 6 hours"
echo "3. Every hour"
echo "4. Weekdays only (Mon-Fri at midnight)"
echo "5. Custom schedule"
echo "6. Skip cron setup for now"

read -p "Enter your choice (1-6): " choice

case $choice in
    1)
        schedule="0 0 * * *"
        description="Daily at midnight"
        ;;
    2)
        schedule="0 */6 * * *"
        description="Every 6 hours"
        ;;
    3)
        schedule="0 * * * *"
        description="Every hour"
        ;;
    4)
        schedule="0 0 * * 1-5"
        description="Weekdays only (Mon-Fri at midnight)"
        ;;
    5)
        echo "Enter custom cron schedule (e.g., '0 6 * * *' for daily at 6 AM):"
        read -p "Schedule: " schedule
        description="Custom schedule: $schedule"
        ;;
    6)
        echo "⏭️  Skipping cron setup"
        echo ""
        echo "📝 To set up cron later, run:"
        echo "   crontab -e"
        echo "   Then add: $schedule $SCRIPT_DIR/auto-commit.sh >> $SCRIPT_DIR/auto-commit.log 2>&1"
        exit 0
        ;;
    *)
        echo "❌ Invalid choice"
        exit 1
        ;;
esac

# Create the cron entry
cron_entry="$schedule $SCRIPT_DIR/auto-commit.sh >> $SCRIPT_DIR/auto-commit.log 2>&1"

# Add to crontab
(crontab -l 2>/dev/null; echo "$cron_entry") | crontab -

echo ""
echo "✅ Cron job configured successfully!"
echo "📅 Schedule: $description"
echo "📁 Script: $SCRIPT_DIR/auto-commit.sh"
echo "📝 Logs: $SCRIPT_DIR/auto-commit.log"

echo ""
echo "🔍 To verify your cron job:"
echo "   crontab -l"

echo ""
echo "📊 To monitor execution:"
echo "   tail -f $SCRIPT_DIR/auto-commit.log"

echo ""
echo "🎉 Setup complete! Your GitHub streak will be maintained automatically." 