---
name: simplify
description: Review changed code for reuse, quality, and efficiency, then fix any issues found.
---

# Simplify

## Phase 1: Identify Changes

`git diff` (or `git diff HEAD` if staged). No git changes → review recent files from context.

## Phase 2: Three Agents in Parallel (single message, full diff to each)

### Agent 1: Reuse

- Search utility dirs, shared modules, adjacent files for existing replacements
- Flag new functions duplicating existing ones; suggest replacement
- Flag hand-rolled string ops, path handling, env checks, type guards that could use existing utilities

### Agent 2: Quality

- **Redundant state**: duplicates existing state; derivable cached values; observers/effects replaceable with direct calls
- **Parameter sprawl**: new params instead of generalizing existing signature
- **Copy-paste variation**: near-duplicates → shared abstraction
- **Leaky abstractions**: internal details exposed; existing abstraction boundaries broken
- **Stringly-typed**: raw strings where constants/enums (string unions)/branded types already exist
- **Unnecessary JSX nesting**: wrapper elements with no layout value — check if inner props (flexShrink, alignItems, etc.) already provide needed behavior
- **Unnecessary comments**: delete WHAT explanations; keep only WHY (hidden constraints, invariants, workarounds)

### Agent 3: Efficiency

- **Unnecessary work**: redundant computations, repeated reads, duplicate API calls, N+1
- **Missed concurrency**: sequential independent ops → parallel
- **Hot-path bloat**: blocking work added to startup/per-request/per-render
- **Recurring no-op updates**: unconditional state updates in loops/intervals/handlers → change-detection guard; verify wrapper functions respect same-reference returns (caller no-ops silently defeated otherwise)
- **Unnecessary existence checks**: TOCTOU — operate directly, handle errors
- **Memory**: unbounded structures, missing cleanup, listener leaks
- **Overly broad ops**: full file read for partial need; load all when filtering for one

## Phase 3: Fix

Aggregate findings. Fix each. Skip false positives without comment. Summarize fixes (or confirm clean).
