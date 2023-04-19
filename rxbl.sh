#!/bin/bash

# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# Get the domain to blacklist from the user
read -p "Enter the domain you want to blacklist: " domain

# Generate the regex pattern for the domain
regex=$(echo "$domain" | sed -e 's/[.]//g' | sed -e 's/\(.\)/\1\\./g')

# Create ufw rule to block traffic from the domain
ufw deny from any to $regex

# Create fail2ban filter to block traffic from the domain
cat << EOF > /etc/fail2ban/filter.d/blacklist-$domain.conf
[Definition]
failregex = ^<HOST> .* $domain
EOF

# Restart fail2ban to apply the new filter
systemctl restart fail2ban
