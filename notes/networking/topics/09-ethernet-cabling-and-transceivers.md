# Ethernet, Fiber, Copper, Transceivers and Connectors

## Detailed concepts, examples, and edge cases

Ethernet standards: IEEE 802.3. Examples include 10BASE-T and 10GBASE-T copper, 1000BASE-SX fiber. Decoding: number = speed, BASE=baseband, T=twisted pair copper, common suffixes indicate fiber/media characteristics.

Optical fiber: transmission by light; no RF/electrical signal; low interference; signal loss over distance. Multimode: shorter range and lower-cost optics, multiple modes. Single-mode: long range, laser source, small core, more expensive optics.

Copper cabling: fundamental to network build-out. Twisted-pair balanced operation uses opposite signals and twisting to reduce interference. Cable speed depends on standard/category/length. Cable supports signal rates; speed is not a property of the raw cable alone.

Coaxial cable: one or more conductors share a common axis; used in television/digital-cable contexts. Twinaxial: two inner conductors, common in some short direct-attach Ethernet/SFP cabling; notes say low cost/low latency.

Network transceivers: modular interfaces that add the appropriate transceiver to a device; copper/fiber modules are not directly interchangeable. SFP/SFP+; SFP+ supports 10 Gb/s class; QSFP+ supports 40 Gb/s class; breakout/direct-attach concepts.

Fiber connectors: SC, LC, ST, MPO/MTP. SC is a popular push/pull connector; LC is smaller/compact with latch; ST uses a bayonet twist-lock; MPO/MTP terminates multiple fibers in one connector.

## Ethernet standards
IEEE 802.3 defines Ethernet. Common naming patterns encode speed/media information. Examples include 10BASE-T for 10 Mb/s over twisted-pair copper, 100BASE-TX for Fast Ethernet, and 1000BASE-X/T families for Gigabit Ethernet.

### Decoding Ethernet names

- **Number:** nominal data rate, e.g. 1000 Mb/s.
- **BASE:** baseband signaling.
- **T:** twisted-pair copper.
- **X:** commonly used for fiber/PCS-related Gigabit Ethernet naming.
- **F/SX/LX and similar suffixes:** media/optics variant depending on standard.

A written shorthand such as `1000BASE-T` therefore means roughly: 1000 Mb/s, baseband, twisted-pair copper.

## Twisted-pair copper
Ethernet twisted pair uses pairs of conductors carrying differential signals. Twisting helps reject external interference and reduces crosstalk between pairs. Common cabling categories include Cat5e, Cat6 and Cat6A, with different performance limits.

### Why twisting helps
Interference tends to affect both conductors of a balanced pair similarly. The receiver can reject common-mode noise while detecting the intended differential signal. Different pairs use different twist rates to reduce pair-to-pair coupling.

## Coaxial cable
Coax has a central conductor surrounded by dielectric insulation, shielding and an outer conductor. It is still used in applications such as cable broadband and some RF systems, although twisted pair and fiber dominate modern enterprise Ethernet access networks.

## Fiber-optic cable
Fiber transmits light rather than electrical signals and is immune to electromagnetic interference.

### Multimode fiber (MMF)
- Larger core than single-mode.
- Uses multiple propagation modes.
- Typically suited to shorter distances within buildings/data centers.
- Commonly uses LED or VCSEL-class optical sources depending on system.

### Single-mode fiber (SMF)
- Very small core.
- One primary propagation mode.
- Supports much longer distances.
- Commonly uses laser-based optical sources.
- Often costs more at the optical-module/system level.

## Transceivers
A transceiver converts the electrical/optical signaling appropriate to the interface and medium. Pluggable optical/copper modules allow a switch/router to support different media without replacing the whole device.

### SFP family
- **SFP:** Small Form-factor Pluggable.
- **SFP+:** commonly used for 10 Gb/s Ethernet.
- **SFP28:** commonly used for 25 Gb/s Ethernet.
- **QSFP/QSFP+:** multi-lane pluggable form factors commonly used at 40 Gb/s and beyond depending on standard/module.

Exact supported rates depend on the module and switch/router platform.

## Fiber connectors
- **SC:** larger push-pull connector, common in older installations.
- **LC:** smaller, compact latch-style connector; very common in modern data-center fiber.
- **ST:** bayonet-style connector, older but still encountered.
- **MPO/MTP:** multi-fiber push-pull connector used for high-density parallel fiber links.

## Media path
```text
Switch port → transceiver → cable/fiber plant → transceiver → remote port
```

## Verification references

The links below document the verification basis for this file and are optional for study.

- [Professor Messer — CompTIA N10-009 Network+ course](https://www.professormesser.com/network-plus/n10-009/n10-009-video/n10-009-training-course/)
