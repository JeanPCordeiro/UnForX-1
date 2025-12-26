# UnForX Coding Guidelines

This document defines the mandatory coding rules for UnForX.

These guidelines exist to preserve:
- determinism
- readability
- long-term maintainability
- strict alignment with specifications

All contributors must follow these rules.

---

## 1. General Principles

- Code must implement specifications exactly
- Do not invent behavior
- Do not guess missing details
- If something is unclear, STOP and ask
- Prefer clarity over cleverness

---

## 2. Language & Style

UnForX code is written in **C** (and C++ only where required by frameworks).

### Style rules
- Use clear, descriptive names
- Avoid abbreviations unless well-known
- One responsibility per function
- Keep functions short and focused

---

## 3. Determinism Rules (Critical)

- No hidden state
- No reliance on timing
- No sleeps or delays
- No busy waiting (except where explicitly specified)
- No background threads

If behavior depends on timing, it is wrong.

---

## 4. Scheduling & Blocking

- Cooperative scheduling only
- Tasks block **only via syscalls**
- No voluntary yields
- No blocking in HAL
- No blocking in interrupts
- Scheduler owns the main loop

---

## 5. Memory Rules

- No MMU assumptions
- No unbounded allocation
- No allocation in interrupts
- VM memory and kernel memory must remain separate
- Free all task memory on task termination

---

## 6. Interrupt Rules

Interrupt handlers must:
- be short
- acknowledge hardware
- signal events only

Interrupt handlers must NOT:
- allocate memory
- log
- block
- access filesystem or networking
- change task states directly

See `kernel/INTERRUPT_POLICY.md`.

---

## 7. HAL Rules

- HAL must be thin
- HAL must not implement policy
- HAL must not block
- HAL must not schedule
- HAL must translate hardware behavior into kernel-neutral signals

HAL is a boundary, not a subsystem.

---

## 8. Error Handling

- Use kernel-defined error codes only
- Do not invent error values
- Propagate errors explicitly
- Do not silently ignore errors

See `kernel/errors/ERROR_CODES.md`.

---

## 9. Logging

- Logging is optional
- Logging must not affect behavior
- No logging in interrupts
- No logging in steady-state scheduler loop

See `kernel/LOGGING_POLICY.md`.

---

## 10. AI / LLM-Generated Code

AI-assisted code is allowed only if:
- it follows all specifications
- it follows `docs/LLM_IMPLEMENTATION_PLAYBOOK.md`
- it is reviewed by a human
- it does not redesign anything

AI tools must not be used to fill specification gaps creatively.

---

## 11. What Not To Do

Do NOT:
- add POSIX abstractions
- add threads or preemption
- add time-based sleeps
- add speculative optimizations
- refactor unrelated code
- change architecture in code

---

## 12. Review Criteria

Code will be reviewed for:
- specification compliance
- determinism
- clarity
- minimalism
- correctness

Performance is secondary at this stage.

---

## Status

This document is **authoritative** and applies to all code in the UnForX project.
