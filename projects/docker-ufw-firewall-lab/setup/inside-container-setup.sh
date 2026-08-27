#!/bin/bash
# RUN THESE COMMANDS INSIDE THE CONTAINER (after docker run drops you in)

# Check container network
ip addr

# Check UFW
ufw status

# Start SSH daemon
mkdir -p /run/sshd
/usr/sbin/sshd

# Start simple HTTP listeners to mimic real services
python3 -m http.server 80 --bind 0.0.0.0 &
python3 -m http.server 3000 --bind 0.0.0.0 &
python3 -m http.server 8080 --bind 0.0.0.0 &

# Check listening ports
ss -lnt

# Expected services:
#   22   SSH
#   80   HTTP
#   3000 HTTP
#   8080 HTTP
