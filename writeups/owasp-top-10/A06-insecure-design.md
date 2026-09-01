# A06 — Insecure Design
 
## Definition
Flawed logic or architecture built into a system from the very start —
usually the result of skipping threat modeling, design requirements review,
etc. during initial development.
 
**Example:** AI-generated code shipped without a security review.
 
## Key Point
**You can't patch an insecure design.** It's not a bug you fix with a
single code change — it's baked into the workflow, the logic, and the
trust boundaries of the system itself. Fixing it usually means
re-architecting, not patching.
 
## 2025 Patterns
- Weak business-continuity logic
- Flawed assumptions about user or model behavior
- AI components with unchecked authentication
- Missing guardrails for LLMs and automation agents
- Test/debug bypasses accidentally left in the shipped system
- No consistent abuse-case review during design
- No AI-specific threat modeling performed at all
