#!/bin/bash
# Run this INSIDE the container to enable and configure UFW

ufw status
ufw enable

sudo ufw allow <port>/<optional: protocol>**
ufw allow 80/tcp    # HTTP

#More Advanced Synatx
#sudo ufw allow from <target> to <destination> port <port number> proto <protocol name>
ufw allow from 172.17.0.1 to any port 22 proto tcp # SSH 

#Your firewall id now configured to block all incoming traffic except coming on port 80 from anywhere or port 22 from <given IP> 
#with tcp protocol
