#!/bin/bash
# DOCKER FIREWALL LAB — build and launch target container
# Ubuntu 22.04 + UFW + FTP + SSH + SMTP + HTTP

# 1. Create lab directory
mkdir -p ~/docker-firewall-lab
cd ~/docker-firewall-lab

# 2. Build the target image (uses Dockerfile in this same folder)
docker build -t firewall-target .

# 3. Remove an old container with the same name, if present
docker rm -f firewall-target 2>/dev/null || true

# 4. Create persistent target container
#    NET_ADMIN allows UFW/iptables to operate inside
#    the container's network namespace.
docker run -it \
    --name firewall-target \
    --cap-add=NET_ADMIN \
    --cap-add=SYSLOG \
    firewall-target
