# Data Types and Classifications
**Source provenance:** Handwritten lecture notes from Professor Messer’s free CompTIA Security+ **SY0-701** training course.
**Professor Messer course alignment:** 3.3 – Protecting Data → Data Types and Classifications
**Coverage:** source pages 50–53

## Data types
The notebook lists several categories:
- **Regulated:** managed by a third party or government and subject to compliance requirements such as PCI-DSS.
- **Trade secret:** organizational secret/formula/knowledge that is uniquely valuable to the organization.
- **Intellectual property:** may be publicly visible in some cases, but is still protected by IP law/copyright/patent/trademark controls.
- **Legal information:** court documents, records, PII and other sensitive information governed by different rules; some legal information may be public, some private.
- **Financial information:** company financials, credit-card/bank information, customer private data; normally not public.
- **Human-readable:** clear text, videos, etc.
- **Non-human-readable:** hidden/encoded information such as images/barcodes/encoded formats.
- **Hybrid:** formats such as CSV, XML, and JSON.

## Data classification
Not all data needs the same security controls. The notes give examples of:
1. **Proprietary** — organizational property, often unique/trade-secret material.
2. **PII** — personally identifiable information such as name or date of birth.
3. **PHI** — protected health information tied to an identifiable individual/patient.
4. **Sensitive information** — includes intellectual property, PII, and PHI in the notes.
5. **Confidential** — highly sensitive and requires approval to view.
6. **Public / unclassified** — no restriction.
7. **Private / classified / restricted** — restricted access and may require NDA or other controls.
8. **Critical** — data that should remain available.

Classification drives access control, encryption, retention, monitoring, and handling requirements.
