# GraphDB Bug Lab

A collection of reproducible graph-database bug cases, minimized queries, debugger evidence, root-cause analysis, and regression-test material.

This repository records both newly investigated failures and historical bugs rediscovered through automated testing. Every case clearly states whether it is new, previously reported, fixed, duplicated, or unresolved.

## Cases

| Database | Version | Failure | Status | Case |
|---|---|---|---|---|
| Kuzu | 0.11.3 | Persistent `SIGFPE` in `PathPropertyProbe` after `DETACH DELETE` | Historical known issue | [View case](cases/kuzu/path-property-probe-sigfpe/) |

## Method

Each case aims to include:

1. A minimal deterministic reproduction.
2. Expected and observed behavior.
3. Exact database and platform versions.
4. Native crash evidence when available.
5. The first invalid internal state.
6. Source-level root-cause analysis.
7. Related issues, fixes, and regression tests.
8. A clear novelty and disclosure status.

## Status labels

- `new-unreported`: no earlier report has been identified.
- `reported`: submitted to the responsible project.
- `historical-known`: an earlier related report or fix exists.
- `duplicate`: confirmed to share the same root cause as an existing report.
- `fixed`: verified on a maintained release.
- `unresolved`: reproducible failure without sufficient root-cause evidence.

## Current tools

The initial cases are generated or reduced with GRAF and investigated using tools such as GDB, source comparison, query reduction, and controlled database-state experiments.

## Repository policy

This repository does not assign CVE identifiers or describe historical bugs as new vulnerabilities. Security impact and novelty are recorded only when supported by evidence.

Large database files, third-party binaries, core dumps, credentials, and private data are not committed. Reproduction scripts and checksums are preferred.

## License

A repository license will be added before broader reuse or contribution.