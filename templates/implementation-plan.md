---
title: "<topic> Implementation Plan"
design_ref: "<path to design document>"
created: "<ISO 8601 timestamp>"
status: "draft"
total_phases: <integer>
estimated_files: <integer>
---

# <Topic> Implementation Plan

## Dependency Graph

```
[ASCII diagram showing phase dependencies and parallel opportunities]
```

## Execution Strategy

| Stage | Phases | Execution | Agent Count | Notes |
|-------|--------|-----------|-------------|-------|
| 1     | Phase 1 | Sequential | 1 | Foundation |

## Phase 1: <Phase Name>

### Objective
[Clear, measurable statement of what this phase delivers]

### Agent: <agent-name>
### Parallel: <Yes/No>

### Files to Create

- `path/to/file` — [Purpose, key interfaces/classes to define]

### Files to Modify

- `path/to/existing/file` — [What changes and why]

### Implementation Details

[Interface definitions, base class contracts, dependency injection patterns, error handling strategy]

### Validation

- [Commands to run and expected outcomes]

### Dependencies

- Blocked by: [Phase IDs or "None"]
- Blocks: [Phase IDs or "None"]

---

## File Inventory

| # | File | Phase | Purpose |
|---|------|-------|---------|
| 1 | `path/to/file` | 1 | [Purpose] |
