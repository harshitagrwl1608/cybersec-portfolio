# Network Troubleshooting Methodology

**Source pages:** added notes PDF, pages 10–13.

## Flowchart

```mermaid
flowchart TD
    A["Uh oh! it's broken"] --> B["Identify the problem"]
    B --> C["Establish a theory"]
    C --> D["Test the theory"]
    D --> E{"Evaluate results — Does it work?"}
    E -- No --> C
    E -- Yes --> F["Establish plan of action"]
    F --> G["Implement the plan"]
    G --> H["Verify full system function"]
    H --> I["Document findings"]
    I --> J["Works? yay!!"]
```

## 1. Identify the problem
- Gather info.
  - E.g. log duplicating issue.
  - Question users.
  - Identify symptoms.
- What has changed??
  - From when it was working fine?

## 2. Establish theory
- Start with obvious.
- Consider everything.
  - Examine problem from top of OSI model to bottom.
  - And reverse.
- Divide & conquer.

## 3. Test the theory
- A virtual / test change.
- Yes → continue.
- No → re-establish theory.

## 4. Create a plan
- Build a plan.
  - With minimum impact on uptime.
- Have backup plans (rollback tool).

## 5. Implementation
- Try the fix.
- Escalate as necessary.
  - 3rd party.

## 6. Verify system function
- Testing → use case(s).

## 7. Document finding
- For future use.
- Forensics.
- Create a formal DB **[source wording unclear]**.
