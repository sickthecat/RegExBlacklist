# RegExBlacklist
A simple ufw and fail2ban bash script with ease of use in mind.

This script will prompt the user to enter the domain they want to blacklist, and then generate a regex pattern to match that domain. It will then create a ufw rule to block traffic from that domain, and create a fail2ban filter to block traffic from that domain as well. Finally, it will restart fail2ban to apply the new filter.

Note: This script assumes that both ufw and fail2ban are already installed and configured on the system. If they are not, you will need to install and configure them before running this script.
