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
