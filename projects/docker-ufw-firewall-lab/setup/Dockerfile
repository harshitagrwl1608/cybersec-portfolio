FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y ufw openssh-server net-tools iproute2 && \
    apt-get clean

RUN mkdir /var/run/sshd

EXPOSE 22 80 443

CMD ["/bin/bash"]
