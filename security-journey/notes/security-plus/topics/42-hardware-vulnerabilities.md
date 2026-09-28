# Hardware & Virtualization Vulnerabilities

**Combined source pages:** See INDEX.md. **Later-notes source PDF:** page(s) are listed in INDEX.md.

### Page 75
# Hardware Vulnerability
- Surrounded by hardware device
  - due to not everyone have access to OS
- As they are connected to network
  - could be a entry point
- E.g. IoT device
  - security landscape has grown

## Firmware
- Software inside hardware
- Only locally vendors have knowledge about firmware and can update & fix
- But they are not generally care enough for it
- E.g. Transom? [unclear] control -> root? [unclear]

### Page 76
## Example: March 2017 -> [Run?]Over? [Cooperation?]

# Resource Race?
- A hypervisor manages the relationship b/w physical & virtual resources
  - RAM, storage, CPU availability
- Resource may be reused b/w VMs
  - e.g. 1TB RAM distributed among 3 VMs having 2GB each
- Data can inadvertently be shared b/w VMs
  - usually hypervisor prevents that
  - however wrong config -> leaked!

### Page 77
# End-of-Life (EOL)
- In future, manufacture stop selling product but may support it for some more time
- EOL (end of service life)
  - manufacturer stops selling product
  - no longer supported
  - no updates anymore

# Legacy platforms
- Really old-running devices
- May be running end-of-service software
  - risk needs to be compared with return
- Big? If it is very critical to company -> add more protection

### Page 78
# Virtualization Vulnerability
## Virtualization security
- Quite different
- Support anywhere
- Quantity of resources may vary
  - config / complexity
- VMs -> local privilege escalation, command injection, information disclosure

## VM escape protection
- Virtual machine is self-contained
  - there is no way out OR is there?
- Virtual machine escape
  - Break out & interact with host
  - much greater control
  - huge exploit

### Page 79
## Example: March 2017 -> [Run?]Over? [Cooperation?]

# Resource Race?
- A hypervisor manages the relationship b/w physical & virtual resources
  - RAM, storage, CPU availability
- Resource may be reused b/w VMs
  - e.g. 1TB RAM distributed among 3 VMs having 2GB each
- Data can inadvertently be shared b/w VMs
  - usually hypervisor prevents that
  - however wrong config -> leaked!
