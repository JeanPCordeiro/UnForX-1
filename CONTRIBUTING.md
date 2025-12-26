# Contributing to UnForX

Thank you for your interest in contributing to **UnForX**.

UnForX is an experimental, specification-driven operating system project.
Contributions are welcome, but **must follow strict rules** to preserve
architectural integrity, determinism, and long-term maintainability.

Please read this document carefully before contributing.

---

## 🧠 Project Philosophy

UnForX is built on the following core principles:

- **Specification-first design**
- **Frozen architecture**
- **Deterministic behavior**
- **System-enforced cooperative scheduling**
- **No POSIX compatibility**
- **No MMU assumptions**
- **No background threads**
- **Explicit, analyzable behavior**

Code exists to implement specifications — **not to redefine them**.

---

## 👤 Authority & Decision Making

- **Founder & Architect**: Jean Pierre Cordeiro (@JeanPCordeiro)
- Architectural decisions are **centralized**
- Specifications are the **highest authority**

If there is a conflict between:
- code and specs → specs win
- suggestions and specs → specs win

---

## 📁 Repository Structure

The repository is organized by responsibility:

kernel/ → core OS logic and syscalls
scheduler/ → cooperative scheduler
vm/ → bytecode virtual machine
hal/ → hardware abstraction layer
docs/ → specifications and implementation rules


Each directory contains authoritative specification files.

---

## 🧾 Contribution Types

### ✅ Currently Accepted Contributions

At the current stage of the project, we accept:

- implementation strictly following existing specifications
- bug fixes in already implemented code
- documentation improvements
- build system fixes
- tooling improvements (non-invasive)

### 🚫 Not Accepted (for now)

- architectural redesigns
- feature proposals without specifications
- POSIX compatibility layers
- preemptive scheduling
- background threads
- undocumented syscalls
- speculative optimizations

---

## 🧩 Specification Changes

All specifications are currently **frozen**.

If you believe a specification is:
- incorrect
- incomplete
- ambiguous

Please:
1. Open an issue
2. Clearly explain the problem
3. Propose a **specification change**, not a code change

Do **not** submit code that changes behavior without spec approval.

---

## 🛠️ Implementation Rules

When contributing code:

- Implement **one file at a time**
- Follow the **LLM Implementation Playbook** if using AI tools
- Verify required specifications before coding
- Do not invent behavior to “fill gaps”
- Do not refactor unrelated code
- Keep changes minimal and focused

---

## 🧪 Testing & Validation

- All code must build on the target platform
- Deterministic behavior is mandatory
- Non-deterministic behavior is considered a bug
- Tests must not rely on timing assumptions

---

## 🧵 Scheduling & Concurrency Rules

- Cooperative scheduling only
- Tasks block only via syscalls
- No sleeps, delays, or busy loops
- Interrupts must follow `kernel/INTERRUPT_POLICY.md`

Violations will be rejected.

---

## 🤖 Use of AI / LLMs

AI tools (including ChatGPT) are allowed **only if**:

- they strictly follow the specifications
- they follow `docs/LLM_IMPLEMENTATION_PLAYBOOK.md`
- they stop when specs are missing or unclear
- humans review all generated code

AI tools must **not** be used to redesign or reinterpret UnForX.

---

## 📜 License & Contributions

UnForX is licensed under the **Apache License 2.0**.

By submitting a contribution, you agree that:

- your contribution is licensed under Apache 2.0
- you have the right to submit the contribution
- you grant the necessary copyright and patent rights

---

## 🧾 Commit & Pull Request Guidelines

- One logical change per commit
- Clear, descriptive commit messages
- Reference the relevant specification files
- Pull requests must explain **what spec is being implemented**

Example commit message:
kernel: implement Stage 1.5 console readiness wait


---

## 🚧 Project Status

UnForX is currently in **early implementation**.

The focus is on:
- correctness
- determinism
- spec compliance

Performance and features will be addressed later.

---

## 🙏 Final Note

UnForX is not a typical OS project.

If you enjoy:
- explicit rules
- clear contracts
- long-term thinking
- building something understandable from the ground up

you are very welcome here.

Thank you for respecting the project’s philosophy and structure.
