#!/bin/bash

# UFW Firewall Configuration
set -e

sudo ufw allow 22/tcp
sudo ufw deny 80/tcp
sudo ufw allow 443/tcp
sudo ufw deny 8080/tcp

sudo ufw --force enable
sudo ufw status verbose
