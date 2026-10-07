# Recovery Testing and Parallel Processing
**Source provenance:** Handwritten lecture notes from Professor Messer’s free CompTIA Security+ **SY0-701** training course.
**Professor Messer course alignment:** 3.4 – Resiliency and Recovery → Recovery Testing
**Coverage:** source pages 62

## Recovery testing
Testing should happen before the real disaster. The notes emphasize well-defined rules of engagement, evaluation, and remediation.

### 1. Tabletop exercise
Run a full-scale disaster scenario as a discussion exercise. The organization can identify logistics and decision points without causing a real outage.

### 2. Fail-over
Verify that redundant/high-availability components keep operating when the primary fails. The goal is for users to continue operating without noticing, supported by redundant infrastructure.

### 3. Simulation
Test using a simulated event such as a phishing attack or data breach. The notes mention internal-security tests and automated security checks, including checking whether users click the simulated link.

### 4. Parallel processing
Split a process across multiple/parallel CPUs/cores to improve performance and resilience. The notes say that if one CPU fails, it should be possible to monitor quickly and rebalance the load.
