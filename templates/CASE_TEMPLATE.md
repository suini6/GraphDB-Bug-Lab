# [Database] [Version] — [Short failure title]

## Case status

- Database:
- Affected version:
- Platform:
- Discovery method:
- Status: `new-unreported | reported | historical-known | duplicate | fixed | unresolved`
- CVE: none

## Summary

Describe the failure in two or three sentences.

## Environment

- Operating system:
- Architecture:
- Database build or release:
- Relevant configuration:
- Container or native execution:

## Minimal reproduction

Place the runnable reproduction in a separate file and link it here.

    path/to/repro.file

## Expected behavior

Describe what should happen.

## Observed behavior

Describe the wrong result, exception, hang, signal, or process exit.

## Reproduction reliability

- Reproduction rate:
- Fresh database required:
- Persists after checkpoint:
- Persists after restart:
- Single-threaded reproduction:
- Smallest confirmed input:

## Minimization notes

Record which statements, graph elements, or options are required and which can be removed.

## Dynamic evidence

Include relevant items such as:

- signal or exit code;
- debugger backtrace;
- faulting instruction;
- invalid pointer or value;
- thread information;
- sanitizer output.

Keep raw evidence in the `evidence/` directory.

## First invalid state

Identify the earliest internal state known to be incorrect.

## Root cause

Separate confirmed facts from source-level inference.

### Confirmed

List directly observed evidence.

### Inferred

List conclusions that still require patch-level validation.

## Proposed fix

Describe the intended correction. Do not present an untested patch as verified.

## Regression test

Describe the test that should fail before the fix and pass afterward.

## Related reports and fixes

- Issue:
- Pull request:
- Commit:
- Release:

## Novelty and security status

State whether the case is new, previously reported, a duplicate, or historical.

Do not claim a CVE or security impact without supporting evidence.