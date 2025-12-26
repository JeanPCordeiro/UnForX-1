# UnForX — Implementation Checklist (Authoritative)

This checklist defines the mandatory validation points for implementing
the UnForX operating system.

It must be consulted:
- before starting a new implementation phase
- before committing code
- during code review
- when using LLM-assisted development

No item may be skipped.

---

## 0. Pre-Implementation (MANDATORY)

Before writing any code, verify:

- [ ] I have read the relevant specification files
- [ ] The architecture is frozen and understood
- [ ] I am not redesigning or reinterpreting any component
- [ ] I am implementing exactly one file or one well-defined unit
- [ ] I have identified all dependent subsystems
- [ ] All required specifications exist and are unambiguous
- [ ] If a specification is missing, I STOPPED and asked

---

## 1. Architecture Compliance

Confirm that the implementation:

- [ ] Follows the frozen architecture
- [ ] Respects strict HAL boundaries
- [ ] Does not introduce POSIX concepts
- [ ] Does not introduce background threads
- [ ] Does not introduce preemption
- [ ] Does not assume an MMU
- [ ] Preserves determinism

---

## 2. Scheduling Rules

Verify scheduling behavior:

- [ ] Cooperative scheduling only
- [ ] Scheduling is system-enforced (not user-controlled)
- [ ] Tasks block only via syscalls
- [ ] No voluntary yields
- [ ] Scheduler owns the main loop
- [ ] No blocking in HAL
- [ ] No blocking in interrupts

---

## 3. Console & Boot Rules

Verify boot and console behavior:

- [ ] Console readiness is enforced before boot continues
- [ ] USB CDC waits for host connection (RP2350, ESP32)
- [ ] USB keyboard waits for presence (x86, Raspberry Pi)
- [ ] Console output is ANSI-compliant
- [ ] Console size is fixed at 80×25
- [ ] No output before console readiness

---

## 4. VM Rules

Verify VM behavior:

- [ ] VM executes only when scheduled
- [ ] VM returns control to the scheduler
- [ ] VM does not own a main loop
- [ ] VM memory is isolated from kernel memory
- [ ] Bytecode matches the specification exactly
- [ ] No architecture-specific assumptions

---

## 5. Memory Rules

Verify memory usage:

- [ ] No dynamic allocation in interrupts
- [ ] No unbounded allocations
- [ ] Memory is freed on task termination
- [ ] Kernel and VM memory are separate
- [ ] Stack usage is bounded and predictable

---

## 6. Interrupt Rules

Verify interrupt behavior:

- [ ] Interrupt handlers are short
- [ ] Interrupts acknowledge hardware only
- [ ] Interrupts signal events, not scheduling
- [ ] No logging in interrupts
- [ ] No filesystem or networking access in interrupts

---

## 7. Filesystem Rules

Verify filesystem behavior:

- [ ] FAT32 implemented via Chan FatFs
- [ ] Block device HAL is respected
- [ ] Filesystem is mounted deterministically at boot
- [ ] No background filesystem threads
- [ ] Errors propagate via kernel error codes only

---

## 8. Networking Rules

Verify networking behavior:

- [ ] Wi-Fi only (no Ethernet assumptions)
- [ ] lwIP RAW API only
- [ ] Poll-driven progression
- [ ] No networking threads
- [ ] Networking respects cooperative scheduling
- [ ] Socket behavior is deterministic

---

## 9. Error Handling

Verify error behavior:

- [ ] Kernel-defined error codes only
- [ ] HAL errors are translated properly
- [ ] Errors are never silently ignored
- [ ] Panic conditions are respected
- [ ] Error paths are deterministic

---

## 10. Logging Rules

Verify logging behavior:

- [ ] Logging is optional and removable
- [ ] Logging does not affect behavior
- [ ] No logging in interrupts
- [ ] No logging in steady-state scheduler loop

---

## 11. LLM Usage Rules (If Applicable)

If AI tools are used:

- [ ] Followed `docs/LLM_IMPLEMENTATION_PLAYBOOK.md`
- [ ] Specification check performed before coding
- [ ] No creative gap-filling
- [ ] Human reviewed all generated code
- [ ] Stop conditions respected

---

## 12. Commit & Review Readiness

Before committing:

- [ ] Changes are minimal and focused
- [ ] Commit message references the implemented spec
- [ ] No unrelated refactors
- [ ] Code builds on the target platform
- [ ] Deterministic behavior verified

---

## Final Rule

> If any checkbox cannot be checked, **STOP**.

Fix the issue or update the specifications before proceeding.

---

## Status

This checklist is **authoritative** and applies to all UnForX development.
