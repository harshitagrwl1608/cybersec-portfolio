# Security+ Digital Notes

A standalone, GitHub-friendly reconstruction of the uploaded Security+ notebook material.

## Structure

```text
security-plus/
├── README.md
├── INDEX.md
├── topics/
│   ├── 01-device-security.md
│   ├── 02-security-rules.md
│   ├── ...
│   └── 61-directory-traversal.md
└── source-images/
    ├── README.md
    ├── INDEX.md
    ├── index/
    ├── initial-26/
    └── later-116/
```

## Reading model

Each file in `topics/` is designed to be read **without opening the source images or consulting another note to understand the topic**. The files include definitions, explanations, examples, mitigations, detection/troubleshooting guidance, and the important details captured from the notebook.

### Flowcharts

All reconstructed flowcharts are embedded directly in their corresponding topic files as GitHub-compatible Mermaid blocks. There is intentionally **no separate FLOWCHARTS.md dependency**.

### Source images

The original page images are kept separately under `source-images/` only for visual reference and fidelity checks. `source-images/INDEX.md` maps every image to a combined page and topic; `source-images/index/` contains one metadata/index file per image.

### Fidelity

The notes preserve the important original examples and terminology while adding standalone explanations and clarifications. Where a handwritten fragment was genuinely unreadable, the notes do not invent a value; the surrounding concept is explained normally and the reference image remains available for checking.
