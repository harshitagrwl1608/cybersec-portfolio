# Handwritten Notes — Transcription / Structured Notes

This file keeps the core ideas represented in the original handwritten material while organizing them into a GitHub-readable form.

## Main workflow

> **Problem → Identify → Establish theory → Test → Evaluate → Plan → Implement → Verify → Document**

The troubleshooting process is iterative: if a tested theory does not explain the problem, return to **Establish a Theory** and investigate another probable cause.

## Main ideas

### Identify the problem

- Gather information.
- Reproduce/duplicate the issue where practical.
- Question affected users.
- Identify symptoms.
- Ask what changed since the issue last worked.

### Establish a theory

- Start with obvious causes.
- Inspect the OSI stack.
- Work top-down or bottom-up.
- Divide and conquer.

### Test the theory

- Make a controlled/minimal change or test.
- Observe the result.

### Evaluate

- If the evidence does not support the theory, build another theory.
- If it does, establish a plan of action.

### Plan and implement

- Prefer low-impact changes.
- Record the current state.
- Prepare rollback options.
- Apply the fix.
- Escalate when necessary.

### Verify and document

- Verify full system functionality.
- Record the cause, evidence, fix, and verification.
- Preserve useful information for future use, forensics, and the formal knowledge base.

## Physical / interface / hardware focus

The August 25 study block specifically covers **Cable Issues, Interface Issues, and Hardware Issues** after the general troubleshooting methodology video.

Physical-layer symptoms to recognize include:

- CRC errors
- Attenuation
- Crosstalk

The practical exercise is to be able to name these symptoms and connect them to their causes without looking at the notes.

## Source / uncertainty note

This is a structured learning note, not a claim that every listed troubleshooting action was personally performed on August 25. Completion evidence should be added only after the corresponding practice has actually been performed.
