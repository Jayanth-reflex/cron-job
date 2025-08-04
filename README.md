# 🚀 GitHub Streak Automation

This repository automatically maintains your GitHub streak using **GitHub Actions** - no local setup required!

## ⭐ Recommended: GitHub Actions (Easy Setup)

**GitHub Actions** runs on GitHub's servers, so you don't need your computer to be running. It's free and reliable.

### Quick Setup (5 minutes)

1. **Go to your repository**: https://github.com/Jayanth-reflex/cron-job
2. **Click "Actions" tab** → **"New workflow"** → **"set up a workflow yourself"**
3. **Replace the content** with the code from `GITHUB_ACTIONS_SETUP.md`
4. **Click "Commit changes"**
5. **Test it**: Go to Actions tab → "Auto Commit" → "Run workflow"

📖 **Detailed instructions**: See [GITHUB_ACTIONS_SETUP.md](GITHUB_ACTIONS_SETUP.md)

## 🎯 What You Get

- ✅ **Automatic daily commits** at midnight UTC
- ✅ **No computer needed** - works 24/7
- ✅ **Free** - GitHub provides 2000 minutes/month
- ✅ **Manual trigger** - run anytime you want
- ✅ **Easy monitoring** - see all runs in Actions tab
- ✅ **No SSH keys needed** - uses GitHub's built-in auth

## 📁 Repository Structure

```
cron-job/
├── .github/workflows/auto-commit.yml  # GitHub Actions workflow
├── daily.txt                          # File updated with timestamp
├── auto-commit.sh                     # Local cron script (backup)
├── setup-cron.sh                      # Local setup script (backup)
├── GITHUB_ACTIONS_SETUP.md           # Detailed GitHub Actions guide
└── README.md                         # This file
```

## 🔄 Alternative: Local Cron Job

If you prefer to run automation locally (requires your computer to be on):

### Quick Local Setup
```bash
# Make script executable
chmod +x auto-commit.sh

# Test the script
./auto-commit.sh

# Set up cron (daily at midnight)
crontab -e
# Add: 0 0 * * * /Users/jayanth/Desktop/cron-job/auto-commit.sh >> /Users/jayanth/Desktop/cron-job/auto-commit.log 2>&1
```

📖 **Detailed local setup**: See the local cron instructions below

## 📊 Monitoring

### GitHub Actions (Recommended)
- **Actions tab**: See all workflow runs and status
- **Repository commits**: View automated commits in timeline
- **Manual trigger**: Run anytime via Actions tab

### Local Cron (Alternative)
- **Logs**: `tail -f auto-commit.log`
- **Git status**: `git status`
- **Recent commits**: `git log --oneline -5`

## ⚙️ Customization

### Change Schedule (GitHub Actions)
Edit the `cron` line in `.github/workflows/auto-commit.yml`:

```yaml
# Daily at 6 AM UTC
- cron: '0 6 * * *'

# Every 6 hours
- cron: '0 */6 * * *'

# Weekdays only
- cron: '0 0 * * 1-5'
```

### Change Schedule (Local Cron)
```bash
# Every hour
0 * * * * /path/to/auto-commit.sh

# Every 6 hours
0 */6 * * * /path/to/auto-commit.sh

# Weekdays only
0 0 * * 1-5 /path/to/auto-commit.sh
```

## 🔧 Troubleshooting

### GitHub Actions Issues
1. **Check Actions tab** for error messages
2. **Verify workflow file** syntax is correct
3. **Test manual trigger** to see if it works
4. **Check repository permissions** - ensure Actions are enabled

### Local Cron Issues
1. **Check script permissions**: `ls -la auto-commit.sh`
2. **Test script manually**: `./auto-commit.sh`
3. **Check cron logs**: `sudo grep CRON /var/log/system.log`
4. **Verify SSH keys**: `ssh -T git@github.com`

## 🎉 Benefits Comparison

| Feature | GitHub Actions | Local Cron |
|---------|---------------|------------|
| **Setup** | 5 minutes | 15 minutes |
| **Computer needed** | ❌ No | ✅ Yes |
| **Reliability** | ✅ High | ⚠️ Medium |
| **Monitoring** | ✅ Easy | ⚠️ Manual |
| **Cost** | ✅ Free | ✅ Free |
| **Maintenance** | ✅ None | ⚠️ Some |

## 📝 Next Steps

1. **Choose your method**: GitHub Actions (recommended) or Local Cron
2. **Follow the setup guide** for your chosen method
3. **Test the automation** to ensure it works
4. **Monitor your GitHub streak** - it should stay active!

Your GitHub streak will now be maintained automatically! 🚀

---

## 📚 Detailed Guides

- **[GitHub Actions Setup](GITHUB_ACTIONS_SETUP.md)** - Complete step-by-step guide
- **Local Cron Setup** - See detailed instructions below

## 🔧 Local Cron Setup (Alternative)

If you prefer local automation, here are the detailed steps:

### 1. Make Script Executable
```bash
chmod +x auto-commit.sh
```

### 2. Test the Script
```bash
./auto-commit.sh
```

### 3. Configure SSH Keys (Optional)
```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"

# Add to SSH agent
ssh-add ~/.ssh/id_ed25519

# Test connection
ssh -T git@github.com
```

### 4. Schedule with Cron
```bash
# Open crontab editor
crontab -e

# Add daily schedule (midnight)
0 0 * * * /Users/jayanth/Desktop/cron-job/auto-commit.sh >> /Users/jayanth/Desktop/cron-job/auto-commit.log 2>&1
```

### 5. Verify Setup
```bash
# List cron jobs
crontab -l

# Check logs
tail -f auto-commit.log
```

## 📄 License

This project is open source and available under the MIT License.