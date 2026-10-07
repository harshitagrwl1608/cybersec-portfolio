# Infrastructure Considerations
**Source provenance:** Handwritten lecture notes from Professor Messer’s free CompTIA Security+ **SY0-701** training course.
**Professor Messer course alignment:** 3.1 – Architecture Models → Infrastructure Considerations
**Coverage:** source pages 27–32

## High availability (HA)
Redundancy does not always mean automatic availability; manual setup may still be required. HA typically combines multiple components working together. The notes emphasize that HA can improve availability/scalability but usually increases cost through more equipment, resources, and power/quality requirements.

## Availability
The notes measure availability through:
- System uptime/access.
- Availability only to the right people.
- Spending required to support the system.
- Uptime and how well the system meets its objectives.

## Resilience
Resilience considers:
- How fast a system can recover from a problem.
- How recovery differs by failure type/root cause.
- MTTR (mean time to repair).

## Cost
Consider total cost, not only purchase price:
- Initial investment.
- Maintenance and lifecycle cost.
- Replacement.
- Tax/economic implications.

## Responsiveness
Responsiveness measures how quickly results are delivered, especially for interactive applications. The notes connect speed with an important metric and recognize that different application components can contribute to delay.

## Scalability
Scalability is how easily capacity can increase/decrease. The notes mention elasticity, scale-related cost changes, and the need to monitor security when systems scale.

## Ease of deployment
Cloud automation/orchestration can make deployment easier, but the notes still stress the impact of product engineering/deployment processes, dependencies such as web servers, databases, caching, firewalls, hardware, resources, budget, and change control.

## Risk transference
The notes list transfer mechanisms including:
- Third-party services.
- Cyber insurance.
- Internal insurance/retained risk decisions.
- Legal protections related to customers.

## Ease of recovery
Recovery should be considered in design. The notes emphasize that **time is money**, recovery time after malware matters, and architecture should ask what happens if another component is added or fails.

## Patch availability / inability to patch
Some systems can be patched regularly only after testing. Legacy and embedded systems may not be designed for modern update mechanisms and may require compensating security controls.

## Power and compute
Power is foundational infrastructure. The notes call out primary and backup power, while compute capacity may involve multiple CPUs across cloud platforms for added capacity and stability.
