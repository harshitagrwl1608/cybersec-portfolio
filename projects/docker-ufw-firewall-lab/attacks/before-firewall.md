# Network Reconnaissance & Firewall Lab

## Objective

Perform network reconnaissance against a Docker container and establish a baseline before enabling UFW.


## Target -
Container IP: 172.17.0.2

1. **Network configuration**
  Command used -
   ip a 
   
   Output - Shows the network interfaces and IP addresses assigned to the container.
   ![images](images/firewall_LAB_01.png)
   
2. **SYN Scan**
Command Used - 
sudo nmap -Pn -sS -v 172.17.0.2

Performs a TCP SYN scan to identify open ports.

Output
SYN Scan Result

3.

   
