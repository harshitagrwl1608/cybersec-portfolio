# Cloud Infrastructures
**Source provenance:** Handwritten lecture notes from Professor Messer’s free CompTIA Security+ **SY0-701** training course.
**Professor Messer course alignment:** 3.1 – Architecture Models → Cloud Infrastructures
**Coverage:** source pages 16–18

## Cloud responsibility matrix
IaaS, PaaS, and SaaS split security responsibilities differently. The notes stress that responsibility should be documented and that major cloud providers publish responsibility matrices that vary by service.

## Hybrid considerations
A hybrid environment can combine multiple cloud providers or cloud + on-premises resources. The notes identify several complications:
- Different network-protection models.
- Different configuration requirements.
- Different security monitoring.
- Data may be “locked” or otherwise constrained while moving between providers.

## Third-party vendors
A third-party vendor may provide a service such as a firewall or cloud-based application. Vendor risk assessment should include continuous monitoring and participation in incident response.

## Infrastructure as Code (IaC)
The notes use an example inventory of hosts (mail, web servers, database servers) and describe creating/reproducing infrastructure through code. IaC can also build application infrastructure from a repeatable definition.

## Serverless architecture
Serverless/FaaS divides an application into functions. The notes emphasize:
- Applications can be split into small functions.
- The platform handles the operating-system/runtime layer.
- Deployment and management can be easier.
- Resources can be deployed only when necessary, reducing cost.
- A third party/cloud provider manages much of the underlying environment.

### Security consideration
Serverless changes the security boundary: identity, API gateways, function permissions, dependencies, and provider-managed infrastructure become critical controls.
