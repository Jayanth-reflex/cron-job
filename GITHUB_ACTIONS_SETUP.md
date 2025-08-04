# 🚀 GitHub Actions Automation Setup

This guide will help you set up **GitHub Actions** to automatically commit to your repository daily, maintaining your GitHub streak without needing your computer to run.

## ✅ What You'll Get

- **Automatic daily commits** at midnight UTC
- **No local setup required** - GitHub runs everything
- **Manual trigger option** - you can run it anytime
- **No computer needed** - works even when your computer is off
- **Free** - GitHub Actions provides 2000 minutes/month free

## 📋 Step-by-Step Setup

### Step 1: Enable GitHub Actions

1. **Go to your repository**: https://github.com/Jayanth-reflex/cron-job
2. **Click on "Actions" tab** (top of the page)
3. **Click "New workflow"** (green button)
4. **Click "set up a workflow yourself"**

### Step 2: Create the Workflow File

1. **Replace the default content** with the code below
2. **Click "Commit changes"** (green button at bottom)

```yaml
name: Auto Commit

on:
  schedule:
    # Runs daily at midnight UTC
    - cron: '0 0 * * *'
  # Allow manual trigger
  workflow_dispatch:

jobs:
  auto-commit:
    runs-on: ubuntu-latest
    
    steps:
    - name: Checkout repository
      uses: actions/checkout@v4
      with:
        token: ${{ secrets.GITHUB_TOKEN }}
    
    - name: Configure Git
      run: |
        git config --local user.email "action@github.com"
        git config --local user.name "GitHub Action"
    
    - name: Update daily.txt with timestamp
      run: |
        echo "$(date '+%Y-%m-%d %H:%M:%S UTC')" > daily.txt
    
    - name: Commit and push changes
      run: |
        git add daily.txt
        git diff --cached --quiet || git commit -m "Automated commit on $(date '+%Y-%m-%d %H:%M:%S UTC')"
        git push
```

### Step 3: Test the Workflow

1. **Go back to "Actions" tab**
2. **Click on "Auto Commit"** workflow
3. **Click "Run workflow"** (blue button)
4. **Click "Run workflow"** again to confirm

### Step 4: Verify It Works

1. **Wait 1-2 minutes** for the workflow to complete
2. **Check your repository** - you should see a new commit
3. **Check the Actions tab** - you should see a green checkmark

## 🎯 How It Works

1. **Daily Schedule**: GitHub runs the workflow every day at midnight UTC
2. **File Update**: Updates `daily.txt` with current timestamp
3. **Git Operations**: Commits and pushes changes automatically
4. **Manual Trigger**: You can run it anytime by clicking "Run workflow"

## 📊 Monitoring

### Check Workflow Status
- Go to **Actions** tab in your repository
- Click on **"Auto Commit"** workflow
- See all recent runs and their status

### Check Commits
- Go to your repository main page
- See recent commits in the timeline
- Each automated commit will show "GitHub Action" as the author

## ⚙️ Customization Options

### Change Schedule
Edit the `cron` line in the workflow:

```yaml
# Daily at 6 AM UTC
- cron: '0 6 * * *'

# Every 6 hours
- cron: '0 */6 * * *'

# Weekdays only
- cron: '0 0 * * 1-5'

# Twice daily (6 AM and 6 PM)
- cron: '0 6,18 * * *'
```

### Change Commit Message
Edit the commit message line:
```yaml
git commit -m "Your custom message $(date '+%Y-%m-%d %H:%M:%S UTC')"
```

### Add More Files
Add more files to update:
```yaml
- name: Update multiple files
  run: |
    echo "Content 1" > file1.txt
    echo "Content 2" > file2.txt
    git add file1.txt file2.txt
```

## 🔧 Troubleshooting

### Workflow Not Running
1. **Check Actions tab** - see if there are any errors
2. **Verify cron syntax** - use a cron validator online
3. **Check repository permissions** - ensure Actions are enabled

### No Commits Being Made
1. **Check workflow logs** - click on the workflow run
2. **Verify file changes** - the workflow only commits if there are changes
3. **Check branch name** - ensure it's pushing to the correct branch

### Manual Trigger Not Working
1. **Go to Actions tab**
2. **Click "Auto Commit" workflow**
3. **Click "Run workflow"**
4. **Select branch** (usually main)
5. **Click "Run workflow"**

## 🎉 Benefits of GitHub Actions

✅ **No local setup required**
✅ **Works 24/7** - even when your computer is off
✅ **Free** - 2000 minutes/month included
✅ **Reliable** - GitHub's infrastructure
✅ **Easy monitoring** - see all runs in Actions tab
✅ **Manual trigger** - run anytime you want
✅ **No SSH keys needed** - uses GitHub's built-in authentication

## 📝 Next Steps

1. **Follow the setup steps above**
2. **Test with manual trigger**
3. **Wait for first scheduled run** (midnight UTC)
4. **Monitor your GitHub streak** - it should stay active!

Your GitHub streak will now be maintained automatically by GitHub itself! 🚀 