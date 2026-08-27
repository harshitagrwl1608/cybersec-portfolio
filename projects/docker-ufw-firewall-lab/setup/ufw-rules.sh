#!/bin/bash
# Run this INSIDE the container to enable and configure UFW

ufw default deny incoming
ufw default allow outgoing

ufw allow 22/tcp    # SSH
ufw allow 80/tcp    # HTTP

ufw --force enable
ufw status verbose
