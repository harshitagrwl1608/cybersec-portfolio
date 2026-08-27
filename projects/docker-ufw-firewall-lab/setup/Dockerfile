
# DOCKER FIREWALL LAB — TARGET CONTAINER
# Ubuntu 22.04 + UFW + FTP + SSH + SMTP + HTTP

# 1. Create lab directory
mkdir -p ~/docker-firewall-lab
cd ~/docker-firewall-lab


# 2. Create Dockerfile
cat > Dockerfile <<'EOF'
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    ufw \
    openssh-server \
    vsftpd \
    postfix \
    nginx \
    iproute2 \
    net-tools \
    iputils-ping \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# SSH runtime directory
RUN mkdir -p /run/sshd

# Document the ports used by the lab
EXPOSE 21 22 25 80

CMD ["/bin/bash"]
EOF


# 3. Build the target image
docker build -t firewall-target .


# 4. Remove an old container with the same name, if present
docker rm -f firewall-target 2>/dev/null || true


# 5. Create persistent target container
#    NET_ADMIN allows UFW/iptables to operate inside
#    the container's network namespace.
docker run -it \
    --name firewall-target \
    --cap-add=NET_ADMIN \
    firewall-target


# RUN THE FOLLOWING COMMANDS INSIDE THE CONTAINER

# Check container network
ip addr

# Check UFW
ufw status

#some default python services to mimic actual istening services
# Start SSH daemon
mkdir -p /run/sshd
/usr/sbin/sshd

# Start simple HTTP listeners
python3 -m http.server 80 --bind 0.0.0.0 &
python3 -m http.server 3000 --bind 0.0.0.0 &
python3 -m http.server 8080 --bind 0.0.0.0 &

![Example](images/firewall_LAB_14.png)


# Check listening ports
ss -lnt

# Show listening ports
ss -lnt


# Expected services:
#
# 22 SSH
# 8080 HTTP
# 80  HTTP
# 3000 HTTP
# ============================================================
