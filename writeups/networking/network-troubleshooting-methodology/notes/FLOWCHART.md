# Troubleshooting Flowchart

## 1. Core flow

```mermaid
flowchart TD
    A["When: It's broken"] --> B["Identify the problem"]
    B --> C["Establish a theory"]
    C --> D["Test the theory"]
    D --> E{"Evaluate results<br/>Does it work?"}
    E -- "No" --> C
    E -- "Yes" --> F["Establish plan of action"]
    F --> G["Implement the plan"]
    G --> H["Verify full system functionality"]
    H --> I["Document findings"]
    I --> J["Worked — resolved"]
```

## 2. Expanded practical flow

```mermaid
flowchart TD
    A["Incident / Something is broken"] --> B["1. Identify the problem"]

    B --> B1["Gather information"]
    B --> B2["Reproduce / duplicate the issue"]
    B --> B3["Question affected users"]
    B --> B4["Identify symptoms"]
    B --> B5["Ask: What changed since it last worked?"]

    B1 --> C["2. Establish a theory"]
    B2 --> C
    B3 --> C
    B4 --> C
    B5 --> C

    C --> C1["Start with obvious causes"]
    C --> C2["Consider the OSI model"]
    C --> C3["Try top-down or bottom-up"]
    C --> C4["Divide and conquer"]

    C1 --> D["3. Test the theory"]
    C2 --> D
    C3 --> D
    C4 --> D

    D --> D1["Make a controlled / minimal change"]
    D1 --> E{"Does the evidence support the theory?"}

    E -- "No" --> C
    E -- "Yes" --> F["4. Establish a plan of action"]

    F --> F1["Prefer minimal impact"]
    F --> F2["Record current state"]
    F --> F3["Prepare rollback"]

    F1 --> G["5. Implement the plan"]
    F2 --> G
    F3 --> G

    G --> G1["Try the fix"]
    G --> G2["Escalate when necessary"]

    G1 --> H["6. Verify full system functionality"]
    G2 --> H

    H --> H1["Run tests"]
    H --> H2["Check relevant user/test cases"]

    H1 --> I["7. Document findings"]
    H2 --> I

    I --> I1["Record cause, evidence, fix, and verification"]
    I --> I2["Preserve useful information for future use / forensics"]
    I --> I3["Create or update the knowledge base"]

    I1 --> J["Resolved"]
    I2 --> J
    I3 --> J
```

## 3. Loop logic

```text
Establish theory
       ↓
   Test theory
       ↓
Evaluate result
   ↙       ↘
 No         Yes
 ↓           ↓
New theory   Plan
```

A failed hypothesis is evidence that the current theory needs to be revised; it is not a reason to force the original explanation to fit the evidence.

## 4. Compact ASCII version

```text
[It's broken]
      |
      v
[Identify problem]
      |
      v
[Establish theory] <------------------+
      |                               |
      v                               |
[Test theory]                         |
      |                               |
      v                               |
[Evaluate: Does it work?]             |
    |             |                   |
   No            Yes                  |
    |             |                   |
    +-------------+                   |
                  v                   |
       [Establish plan of action]     |
                  |                   |
                  v                   |
          [Implement the plan]        |
                  |                   |
                  v                   |
       [Verify full functionality]    |
                  |                   |
                  v                   |
         [Document findings]          |
                  |                   |
                  v                   |
             [Resolved] -------------+
```
