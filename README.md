<div align="center">

# ⚡ GitHub Streak Automation #

<img src="https://img.shields.io/badge/Automation-GitHub%20Actions-blue?style=for-the-badge&logo=github-actions&logoColor=white" alt="GitHub Actions">
<img src="https://img.shields.io/badge/Cron%20Jobs-Scheduled-green?style=for-the-badge&logo=clock&logoColor=white" alt="Cron Jobs">
<img src="https://img.shields.io/badge/Shell-Script-black?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="Shell Script">
<img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge&logo=open-source-initiative&logoColor=white" alt="MIT License">

**🚀 Keep your GitHub streak alive effortlessly with automated daily commits!**

[Quick Setup](#-quick-setup) • [Features](#-features) • [Usage](#-usage) • [Contributing](#-contributing)

</div>

---

## 📋 Overview

This repository provides an automated solution to maintain your GitHub contribution streak using **GitHub Actions**. No local setup required - everything runs in the cloud for free!

### 🌟 Why Choose This Solution?
- 🔥 **Zero maintenance** - Set it once, forget it forever
- 🌍 **Cloud-based** - Works 24/7 without your computer
- 💰 **Completely free** - Uses GitHub's free tier (2000 minutes/month)
- 🔒 **Secure** - No SSH keys or tokens needed
- 📊 **Transparent** - All runs visible in Actions tab

## ✨ Features

- ✅ **Automated Daily Commits** - Runs at midnight UTC
- ✅ **GitHub Actions Integration** - Cloud-based execution
- ✅ **Manual Trigger Support** - Run anytime on-demand
- ✅ **Local Cron Alternative** - Backup solution included
- ✅ **Comprehensive Logging** - Track all activities
- ✅ **Easy Monitoring** - Visual feedback in Actions tab
- ✅ **Customizable Schedule** - Modify timing as needed
- ✅ **Cross-Platform** - Works on any operating system

## 🚀 Quick Setup

### Method 1: GitHub Actions (Recommended)

> ⭐ **Best Choice**: Runs on GitHub's servers - no local setup needed!

1. **Fork or Clone** this repository
2. **Navigate** to your repository on GitHub
3. **Click** the "Actions" tab
4. **Select** "New workflow" → "Set up a workflow yourself"
5. **Copy** the workflow code from [`GITHUB_ACTIONS_SETUP.md`](GITHUB_ACTIONS_SETUP.md)
6. **Commit** the changes
7. **Test** by going to Actions → "Auto Commit" → "Run workflow"

📖 **Detailed Guide**: See [`GITHUB_ACTIONS_SETUP.md`](GITHUB_ACTIONS_SETUP.md) for step-by-step instructions

### Method 2: Local Cron Job

> 💻 **Alternative**: Runs on your local machine (requires computer to be on)

```bash
# Make script executable
chmod +x auto-commit.sh

# Test the script
./auto-commit.sh

# Set up cron job (daily at midnight)
crontab -e
# Add: 0 0 * * * /path/to/cron-job/auto-commit.sh >> /path/to/cron-job/auto-commit.log 2>&1
```

## 📁 Repository Structure

```
cron-job/
├── .github/
│   └── workflows/
│       └── auto-commit.yml    # GitHub Actions workflow
├── scripts/
│   ├── auto-commit.sh         # Main automation script
│   └── setup-cron.sh          # Local setup helper
├── logs/
│   └── auto-commit.log        # Execution logs
├── data/
│   └── daily.txt              # Timestamp tracking file
├── docs/
│   └── GITHUB_ACTIONS_SETUP.md # Detailed setup guide
└── README.md                   # This documentation
```

## 🎯 Usage

### GitHub Actions

- **Automatic**: Runs daily at midnight UTC
- **Manual**: Actions tab → "Auto Commit" → "Run workflow"
- **Monitor**: Check Actions tab for run history
- **Customize**: Edit `.github/workflows/auto-commit.yml`

### Local Cron

- **Check status**: `crontab -l`
- **View logs**: `tail -f auto-commit.log`
- **Manual run**: `./auto-commit.sh`
- **Stop**: `crontab -e` and remove the line

## ⚙️ Customization

### Schedule Modification

**GitHub Actions** (edit `.github/workflows/auto-commit.yml`):
```yaml
schedule:
  - cron: '0 6 * * *'    # Daily at 6 AM UTC
  - cron: '0 */6 * * *'  # Every 6 hours
  - cron: '0 0 * * 1-5'  # Weekdays only
```

**Local Cron**:
```bash
0 * * * *     # Every hour
0 */6 * * *   # Every 6 hours
0 0 * * 1-5   # Weekdays only
```

### Commit Message Customization

Edit the script to modify commit messages:
```bash
COMMIT_MSG="Automated commit on $(date '+%Y-%m-%d %H:%M:%S')"
```

## 📊 Monitoring

### GitHub Actions Dashboard
- 📈 **Workflow runs** - Success/failure status
- 📝 **Execution logs** - Detailed output for each run
- ⏱️ **Run duration** - Performance metrics
- 🔄 **Re-run capability** - Retry failed runs

### Local Monitoring
```bash
# Check recent commits
git log --oneline -10

# View cron logs
tail -20 auto-commit.log

# Check git status
git status
```

## 🔧 Troubleshooting

<details>
<summary><strong>GitHub Actions Issues</strong></summary>

1. **Workflow not running?**
   - Check if Actions are enabled in repository settings
   - Verify the cron syntax in workflow file
   - Ensure you have push permissions

2. **Permission denied errors?**
   - Repository must have Actions enabled
   - Check if you're the repository owner or have write access

3. **Commits not appearing?**
   - Verify the workflow completed successfully
   - Check if there are any conflicts in the repository
</details>

<details>
<summary><strong>Local Cron Issues</strong></summary>

1. **Script not executing?**
   ```bash
   # Check permissions
   ls -la auto-commit.sh
   
   # Test manually
   ./auto-commit.sh
   ```

2. **Cron job not running?**
   ```bash
   # Check cron service
   sudo service cron status
   
   # View cron logs (Ubuntu/Debian)
   grep CRON /var/log/syslog
   ```

3. **Git authentication issues?**
   ```bash
   # Test SSH connection
   ssh -T git@github.com
   
   # Configure git credentials
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```
</details>

## 📸 Screenshots

### GitHub Actions Workflow
![GitHub Actions](https://via.placeholder.com/800x300/2ea44f/ffffff?text=GitHub+Actions+Workflow)

### Repository Activity
![Activity Graph](https://via.placeholder.com/800x200/0969da/ffffff?text=GitHub+Activity+Graph)

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **🍴 Fork** the repository
2. **🌿 Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **💾 Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **📤 Push** to the branch (`git push origin feature/amazing-feature`)
5. **🔀 Open** a Pull Request

### Development Setup

```bash
# Clone the repository
git clone https://github.com/Jayanth-reflex/cron-job.git
cd cron-job

# Make scripts executable
chmod +x *.sh

# Test the automation
./auto-commit.sh
```

### Code Style

- Use clear, descriptive commit messages
- Follow shell scripting best practices
- Add comments for complex logic
- Test changes before submitting PR

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2025 Jayanth Reflex

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

## 📞 Support

If you found this project helpful, please consider:

- ⭐ **Starring** the repository
- 🐛 **Reporting** issues
- 💡 **Suggesting** improvements
- 🤝 **Contributing** to the code

---

<div align="center">

**Made with ❤️ by [Jayanth Reflex](https://github.com/Jayanth-reflex)**

🚀 **Keep coding, keep contributing!** 🚀

</div>
