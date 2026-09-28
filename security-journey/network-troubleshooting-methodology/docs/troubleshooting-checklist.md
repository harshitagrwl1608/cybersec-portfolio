# Network Troubleshooting Checklist

Use this as the practical worksheet for the **August 25, 2026** N10-009 troubleshooting study task.

## 1. Identify

- [ ] What exactly is broken?
- [ ] Who is affected?
- [ ] One device or many?
- [ ] One user or many?
- [ ] When did it start?
- [ ] Can it be reproduced?
- [ ] What are the exact symptoms?
- [ ] What error messages appear?
- [ ] What changed since the last known-good state?

## 2. Establish a theory

- [ ] What is the most obvious probable cause?
- [ ] Which OSI layer(s) could explain the symptom?
- [ ] Have I considered both higher and lower layers?
- [ ] Can I divide the problem into smaller sections?
- [ ] What evidence supports the theory?

## 3. Test

- [ ] What is the smallest useful test?
- [ ] Can I make a controlled/minimal change?
- [ ] What result would confirm the theory?
- [ ] What result would disprove it?
- [ ] Did I record the original state?

## 4. Evaluate

- [ ] Did the test support the theory?
- [ ] If no, did I return to theory generation?
- [ ] If yes, is there enough evidence to plan a fix?

## 5. Plan

- [ ] What is the least disruptive fix?
- [ ] What is the expected impact?
- [ ] Is a backup required?
- [ ] Is rollback possible?
- [ ] What is the success criterion?

## 6. Implement

- [ ] Apply the planned fix.
- [ ] Record exactly what changed.
- [ ] Escalate if necessary.
- [ ] Avoid unrelated changes.

## 7. Verify

- [ ] Does the original issue no longer reproduce?
- [ ] Does the user's workflow work?
- [ ] Do relevant test cases pass?
- [ ] Did the change introduce a new problem?
- [ ] Is the system fully functional?

## 8. Document

- [ ] Symptoms
- [ ] Timeline
- [ ] Scope
- [ ] Evidence
- [ ] Theories
- [ ] Tests and results
- [ ] Cause
- [ ] Fix
- [ ] Verification
- [ ] Rollback information
- [ ] Lessons learned
- [ ] Knowledge-base/DB entry

## August 25 practice scenario

**Scenario:** A user says, "Wi-Fi is down."

Write one question for each stage:

1. **Identify:** __________________________________________
2. **Establish a theory:** _________________________________
3. **Test:** ______________________________________________
4. **Evaluate:** ___________________________________________
5. **Plan:** _______________________________________________
6. **Implement:** _________________________________________
7. **Verify + document:** __________________________________

## End-of-day recall

Without looking at the notes, write the seven stages in order:

```text
1. ______________________________
2. ______________________________
3. ______________________________
4. ______________________________
5. ______________________________
6. ______________________________
7. ______________________________
```

Physical-layer symptoms to recall:

- CRC errors → ___________________________________________
- Attenuation → __________________________________________
- Crosstalk → ____________________________________________
