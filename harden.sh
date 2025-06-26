#!/bin/bash
# update & upgrade
apt update && apt -y upgrade

# disable root SSH login
sed -i 's/^PermitRootLogin .*/PermitRootLogin no/' /etc/ssh/sshd_config

# set up UFW firewall
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw --force enable

# install fail2ban
apt -y install fail2ban
systemctl enable fail2ban

echo "Basic Server hardening complete!"
