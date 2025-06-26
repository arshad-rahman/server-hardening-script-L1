<p align="center">
  <a href="https://github.com/arshad-rahman/server-hardening-script-L1.git">
    <img src="https://img.shields.io/badge/Server%20Hardening-Scripts-blue.svg?style=for-the-badge" alt="Server Hardening">
  </a>
</p>

<p align="center">
  <strong>A simple collection of Bash scripts to automate basic security configuration on Ubuntu servers.</strong><br>
  <em>Apply updates, lock down SSH, set up UFW & Fail2Ban—in under 30 seconds.</em>
</p>

<p align="center">
  <a href="https://github.com/arshad-rahman/server-hardening-script-L1.git/actions">
    <img src="https://img.shields.io/github/actions/workflow/status/arshad-rahman/server-hardening-script-L1/build.yml?branch=main&style=flat-square" alt="CI Status">
  </a>
  <a href="https://github.com/arshad-rahman/server-hardening-script-L1/issues">
    <img src="https://img.shields.io/github/issues/arshad-rahman/server-hardening-script-L1.svg?style=flat-square" alt="Open Issues">
  </a>
  <a href="https://github.com/arshad-rahman/server-hardening-script-L1/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/arshad-rahman/server-hardening-script-L1.svg?style=flat-square" alt="License">
  </a>
</p>

---

## 📋 Table of Contents

- [🛠️ Features](#️-features)  
- [🔌 Prerequisites](#-prerequisites)  
- [🚀 Installation](#-installation)  
- [🎯 Usage](#-usage)  
- [📝 Script Breakdown](#-script-breakdown)  
- [🤝 Contributing](#-contributing)  
- [📄 License](#-license)  

---

## 🛠️ Features

- 🚀 **One-step execution**: run all tasks with a single command  
- 🔄 **Auto Update & Upgrade**  
- 🔐 **Disable root SSH login**  
- 🔥 **UFW firewall**: default deny incoming, allow SSH  
- 🛡️ **Fail2Ban**: install, enable & start for intrusion protection  

---

## 🔌 Prerequisites

- **Ubuntu** 18.04 or later  
- A non-root user with `sudo` privileges  
- Internet access for package installation  

---

## 🚀 Installation

```bash
# 1. Clone the repo
git clone https://github.com/arshad-rahman/server-hardening-script-L1.git
cd server-hardening-script-L1

# 2. Make it executable
chmod +x harden.sh
````

---

## 🎯 Usage

Simply run with sudo:

```bash
sudo ./harden.sh
```

**What happens next?**

1. ✅ All packages updated & upgraded
2. 🚫 Root SSH login disabled
3. 🔥 UFW configured & enabled
4. 🛡️ Fail2Ban installed & started

---

## 📝 Script Breakdown

```bash
#!/bin/bash

# 1. Update & upgrade
apt update && apt -y upgrade

# 2. Disable root SSH login
sed -i 's/^PermitRootLogin .*/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl reload sshd

# 3. Configure UFW
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw --force enable

# 4. Install & enable Fail2Ban
apt -y install fail2ban
systemctl enable fail2ban
systemctl start fail2ban

echo "✅ Server hardening complete!"
```

Feel free to **customize**—add more UFW rules, tweak Fail2Ban settings, or integrate additional tools.

---

## 🤝 Contributing

1. Fork the repo
2. Create your feature branch:

   ```bash
   git checkout -b feature/your-feature
   ```
3. Commit your changes:

   ```bash
   git commit -m "Add some feature"
   ```
4. Push to the branch:

   ```bash
   git push origin feature/your-feature
   ```
5. Open a Pull Request

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

<p align="center">
  Built with ❤️ by <a href="https://github.com/arshad-rahman">arshad</a>
</p>
