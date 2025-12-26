# UnForX Governance

This document defines how the UnForX project is governed, how decisions are made,
and how authority is exercised.

UnForX favors **technical clarity, architectural consistency, and accountability**
over committee-driven or consensus-only governance.

---

## 1. Project Ownership

UnForX is founded, owned, and initially maintained by:

**Jean Pierre Cordeiro**  
GitHub: https://github.com/JeanPCordeiro

The founder is the **final authority** on:
- architecture
- specifications
- execution model
- long-term direction

---

## 2. Governance Model

UnForX follows a **Benevolent Dictator for Life (BDFL)**–style model,
adapted for a specification-driven systems project.

This means:
- the founder sets and freezes the architecture
- specifications are authoritative
- discussion is encouraged
- final decisions are centralized

This model is intentional and chosen to:
- preserve architectural coherence
- avoid design-by-committee
- maintain long-term consistency

---

## 3. Specifications as Law

In UnForX:

- Specifications are the highest technical authority
- Code exists to implement specifications
- If code conflicts with specs, **the code is wrong**
- Specifications are versioned and reviewed explicitly

No behavior change is allowed without an approved specification change.

---

## 4. Roles

### Founder / Architect
- Defines and freezes architecture
- Approves or rejects specification changes
- Has final say on technical disputes
- Oversees project direction

### Contributors
- Implement existing specifications
- Improve documentation
- Fix bugs
- Propose improvements via issues

### Reviewers (future)
- May be appointed by the founder
- Review code for spec compliance
- Do not override specifications

---

## 5. Decision-Making Process

### Architectural Decisions
- Made by the founder
- Documented as specifications
- Frozen once accepted

### Implementation Decisions
- Must follow existing specs
- Minor implementation details may be discussed in PRs
- Must not change observable behavior

### Dispute Resolution
- Discuss respectfully in issues or PRs
- Reference specifications
- Final decision rests with the founder

---

## 6. Evolution of the Project

UnForX evolves in **phases**:

1. Architecture & specification (current: frozen)
2. Implementation
3. Stabilization
4. Expansion (future)

Major changes will only be considered:
- after stabilization
- with clear motivation
- with updated specifications

---

## 7. Forks

Forks are permitted under the Apache License 2.0.

However:
- the official UnForX repository defines the canonical architecture
- forks should not claim compatibility unless they follow the specs

---

## 8. Code of Conduct

UnForX expects:
- respectful communication
- technical arguments over opinions
- professionalism

Harassment, hostility, or disruptive behavior will not be tolerated.

---

## Status

This document is **authoritative** and may evolve only through explicit approval
by the founder.
