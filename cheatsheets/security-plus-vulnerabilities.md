# Security+ Vulnerabilities

## Memory / software vulnerabilities
**Memory injection:** attacker-controlled code/data enters an existing process memory space. Watch for unusual process injection, unsigned modules, or abnormal memory permissions.

**Buffer overflow:** input exceeds a buffer boundary and can corrupt adjacent memory/control data.
Mitigations: bounds checking, memory-safe languages where practical, ASLR, DEP/NX, stack canaries, control-flow protections.

**Race condition / TOCTOU:** state changes between a check and its use.
Mitigations: atomic operations, synchronization, locking, minimize check/use windows.

## OS vulnerabilities
Patch supported systems. Disable unused services. Apply secure baselines. Use least privilege and endpoint protection.

## Misconfiguration
Default credentials · excessive permissions · exposed management interfaces · unnecessary services · public storage/resources · weak firewall rules · insecure protocols.
**Fix:** baseline → review → least privilege → drift detection.

## Supply-chain / malicious updates
Risk can enter through vendors, dependencies, build systems, signing keys, repositories, or update infrastructure.
**Controls:** signed artifacts, trusted repositories, protected build pipeline, restricted release access, provenance verification, rollback capability.

## Cloud
Common risks: overly broad IAM, public storage, weak API controls, exposed metadata, insecure security groups, insufficient logging, misconfigured network boundaries.
**Shared responsibility:** exact control ownership depends on service model/provider.

## Mobile
Rooting/jailbreaking weakens platform restrictions. Sideloading bypasses some app-distribution controls.
Controls: supported OS, encryption, screen lock, MDM/UEM, app control, least privilege.

## Zero-day
A vulnerability being actively exploited before an effective vendor patch/defensive fix is broadly available.
Controls: segmentation, application control, virtual patching/WAF/IPS where appropriate, attack-surface reduction, behavioral detection.

## Hardware / virtualization
Firmware/UEFI, DMA-capable devices, hypervisors, VM isolation and shared resources are security boundaries.
Controls: secure boot, signed firmware, IOMMU/DMA protections, hardened hypervisor, tenant isolation, timely firmware updates.

## Application vulnerabilities
SQLi · XSS · CSRF · directory traversal · privilege escalation · insecure authentication · unsafe input/code handling.
**Defense pattern:** validate → constrain → encode/parameterize → authorize server-side → log → monitor.

## Exam distinction
**Vulnerability = weakness. Exploit = method using it. Threat = potential cause. Risk = likelihood × impact.**