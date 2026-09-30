# A05 — Injection
 
## What Is Injection?
An application takes input and mishandles it — instead of properly
pre-processing/sanitizing it, the input is passed directly to something
capable of executing commands (an API, a database, a shell, etc.).
 
## Common Examples
- SQL Injection
- Command Injection
- AI Prompt Injection (see below)
- Server-Side Template Injection (SSTI)
 
**Core principle: always treat input as untrustworthy.**
 
---
 
## For the AI Era: Prompt Injection
 
The system prompt gets blended with user input, which can allow an
attacker to hijack the model's context or extract data it shouldn't
reveal. This is fundamentally a case of **blind trust in the model**.
 
**Common root causes:**
- Input coming from an untrustworthy source
- A model trained on unsafe/unvetted data
- Open backdoors introduced somewhere in the pipeline
 
**Mitigation:** human review is necessary — an LLM's own judgment
about what to trust cannot be the only safeguard.
