# Network Reconnaissance & Firewall Lab

## Objective
Perform network reconnaissance against a Docker container and establish a baseline before enabling UFW.


## Target 
Container IP: 172.17.0.2

## Commands used 
- SYN scan: Performs a stealth TCP SYN scan to identify open TCP ports without completing the full TCP handshake.
  
  nmap -Pn -sS -v <container_ip>

- Host discovery: Checks whether the target is reachable using TCP ACK probes, without performing a port scan
  
  nmap -sn -PA -v <container_ip>.

- Xmas scan: Sends TCP packets with FIN, PSH, and URG flags set to infer port states without a normal SYN connection
  
  nmap -Pn -sX -v <container_ip>.

- NSE scripts: Performs a SYN scan and runs Nmap's standard scripts to gather additional information about discovered services.
  
  nmap -Pn -sS --script=default <container_ip>
  
  nmap -Pn -sS --script=intrusive <container_ip>

## Output
- discovered the ip address of docker container
  ![here_images](../../projects/Images/firewall_LAB_01.png)
- discovered the active services running on target with port number and type of service

  used stealth SYN scan, XMAS scan

   ![here_images](../../projects/Images/firewall_LAB_02.png)
   ![here_images](../../projects/Images/firewall_LAB_03.png)
   ![here_images](../../projects/Images/firewall_LAB_04.png)

- discovered the version number and other small details of every running service
   ![here_images](../../projects/Images/firewall_LAB_06.png)
  
- ran standard scripts auto-built into nmap standard installation --default and --intrusive
   ![here_images](../../projects/Images/firewall_LAB_07.png)
  
   ![here_images](../../projects/Images/firewall_LAB_08_01.png)
   ![here_images](../../projects/Images/firewall_LAB_08_02.png)
   ![here_images](../../projects/Images/firewall_LAB_08_03.png)


## Discovery
- Discovered the ip address of running docker container
- Using nmap port scans, discovered the listening ports and the service protocols running behind each port.
- using flag -sV discovered the versions of services running which can be used to exploit known vulnerabilities
- ran standard scripts to get some interesting information such as which port is susceptible to which type of attack

  
  
