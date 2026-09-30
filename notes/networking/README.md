# Networking Notes — Standalone GitHub-Style Study Repository

These notes were reconstructed from the uploaded handwritten networking notebook and then technically cross-checked against current public documentation and Internet standards.

## Design goals

- Every file in `topics/` is **standalone**: it contains definitions, examples, tables and text diagrams needed to understand that topic.
- Topic files **do not depend on source page images**.
- Flowcharts/diagrams are recreated as Mermaid or ASCII diagrams inside the Markdown.
- The repository currently contains 15 Mermaid flowcharts; see `MERMAID-VERIFICATION.md` for the rendering/syntax audit.
- Where the handwritten notes used shorthand or an outdated/ambiguous statement, the final notes use a corrected technical description and record the correction in the file's verification section.
- `TRACEABILITY.md` is kept separately for audit purposes and is not required for study.

## Structure

```text
networking_repo/
├── README.md
├── QUICK-INDEX.md
├── TRACEABILITY.md
├── SOURCES.md
└── topics/
    ├── 01-osi-model.md
    ├── 02-network-devices-and-functions.md
    ├── ...
    └── 26-device-security-acl-url-content-zones.md
```

## Verification scope

The reconstruction was checked against Professor Messer's N10-009 course, IETF RFCs for core protocols, IANA's current port registry, Cisco Layer-2 security documentation, and NIST Zero Trust guidance where applicable.

## Important usage rule

Open any file in `topics/` directly. You should not need the original PDF, a page image, or another topic file to understand the core material in that file.
