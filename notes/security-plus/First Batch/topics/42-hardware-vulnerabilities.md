# Hardware & Virtualization Vulnerabilities

## Overview
Hardware and virtualization vulnerabilities can expose data or break isolation through firmware bugs, side channels, DMA, insecure peripherals, or hypervisor/resource-sharing flaws.

## Core concepts
- Firmware and BIOS/UEFI provide privileged execution and require secure update mechanisms.
- DMA-capable peripherals can access memory in ways that require appropriate platform protections.
- Virtualization depends on strong isolation between guests and the hypervisor.
- Resource-sharing mistakes can unintentionally expose memory, storage, or network data across virtual machines.

## Practical examples
- A compromised hypervisor or isolation flaw can affect multiple virtual machines on the same host.

## Security / mitigation
- Use secure boot, signed firmware, IOMMU/DMA protections where supported, hardened hypervisors, tenant isolation, and current firmware updates.

## Detection / troubleshooting
- Monitor hypervisor logs, unusual VM-to-VM traffic, firmware changes, host integrity failures, and unexpected device attachment.

## Detailed notes captured from the notebook
# Hardware & Virtualization Vulnerabilities

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

## Example: March 2017 -> [Run?]Over? [Cooperation?]

# Resource Race?
- A hypervisor manages the relationship b/w physical & virtual resources
  - RAM, storage, CPU availability
- Resource may be reused b/w VMs
  - e.g. 1TB RAM distributed among 3 VMs having 2GB each
- Data can inadvertently be shared b/w VMs
  - usually hypervisor prevents that
  - however wrong config -> leaked!

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

## Example: March 2017 -> [Run?]Over? [Cooperation?]

# Resource Race?
- A hypervisor manages the relationship b/w physical & virtual resources
  - RAM, storage, CPU availability
- Resource may be reused b/w VMs
  - e.g. 1TB RAM distributed among 3 VMs having 2GB each
- Data can inadvertently be shared b/w VMs
  - usually hypervisor prevents that
  - however wrong config -> leaked!

## Further reading (optional)
[NIST — hardware/firmware and platform security references](https://csrc.nist.gov/)
