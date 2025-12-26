# 🚀 UnForX

**UnForX** is a **deterministic, VM-based operating system** designed to run on both  
general-purpose computers and embedded hardware.

It provides a **single execution model** across radically different platforms by combining:

- a portable **hybrid stack + register bytecode virtual machine**
- **system-enforced cooperative scheduling**
- a strict **Hardware Abstraction Layer (HAL)**
- a text-only **ANSI console (80×25)**
- **FAT32 storage** (via Chan FatFs)
- **Wi-Fi networking** (lwIP RAW, poll-driven)

UnForX is **specification-driven**, **architecture-frozen**, and built to be
**predictable, analyzable, and portable**.

---

## 🎯 Supported Hardware Targets

UnForX is designed to run on the following platforms:

- **x86 (Intel N100 mini PC)**  
  HDMI output, USB keyboard, Wi-Fi, FAT32

- **Raspberry Pi Zero 2 W**  
  HDMI output, USB keyboard, Wi-Fi, FAT32 (Circle framework)

- **RP2350 (Raspberry Pi Pico 2 W — Waveshare RP2350-Geek)**  
  USB CDC console, SD card, Wi-Fi

- **ESP32-S3 (Waveshare ESP32-S3-Geek)**  
  USB CDC console, SD card, Wi-Fi

Despite their differences, all platforms expose the **same kernel, VM, and syscall model**.

---

## 🧠 Why UnForX Exists

Modern operating systems tend to fall into two extremes:

- **Large general-purpose OSes**  
  Powerful, but complex, non-deterministic, and difficult to reason about.

- **Tiny embedded runtimes**  
  Simple, but fragmented, ad-hoc, and inconsistent across hardware.

UnForX exists to explore a **third path**.

### The core idea

> **One deterministic operating system, one execution model, from PCs to microcontrollers.**

UnForX deliberately rejects:
- POSIX compatibility
- preemptive scheduling
- background threads
- hidden concurrency
- hardware-specific application binaries

Instead, it embraces:
- **explicit control**
- **deterministic behavior**
- **portable bytecode**
- **clear boundaries**
- **specification-first design**

---

## 🧩 Architecture Overview

At a high level, UnForX is composed of:

+-----------------------------+
| User Programs |
| (Portable Bytecode) |
+--------------▲--------------+
|
UnForX Virtual Machine
|
+--------------▲--------------+
| Kernel & Syscalls (Det.) |
+--------------▲--------------+
| Cooperative Scheduler |
+--------------▲--------------+
| HAL (Per Platform) |
+--------------▲--------------+
| Hardware |
+-----------------------------+


### Key architectural properties

- **No MMU required**
- **No preemption**
- **No background threads**
- **No hidden blocking**
- **All blocking is explicit and kernel-managed**
- **All scheduling decisions are deterministic**

---

## 🧵 Scheduling Model

UnForX uses **cooperative, system-enforced scheduling**:

- Tasks never yield voluntarily
- Tasks block **only via syscalls**
- The scheduler owns the main loop
- Interrupts only signal events; they never schedule

This makes execution:
- predictable
- analyzable
- reproducible

---

## 🖥️ Console Model

- Text-only ANSI console
- Fixed **80×25** character grid
- Colors, cursor control, clear, scrolling
- Input via:
  - USB keyboard (x86, Raspberry Pi)
  - USB CDC serial (RP2350, ESP32)

**Boot blocks until console input is available**  
(no silent or headless boots).

---

## 💾 Filesystem

- **FAT32** root filesystem
- Implemented via **Chan FatFs**
- Portable across:
  - Windows
  - Linux
  - macOS
- Synchronous, deterministic semantics

---

## 🌐 Networking

- Wi-Fi only (by design)
- lwIP **RAW API**
- Poll-driven progression
- No background threads
- Deterministic socket behavior

---

## 🧪 Development Philosophy

UnForX is:

- **specification-first**
- **LLM-assisted but human-controlled**
- **architecture-frozen**
- **designed for long-term maintainability**

All development follows a strict **LLM implementation playbook** to ensure:
- no silent assumptions
- no accidental redesign
- no spec drift

---

## 📁 Repository Structure

The repository is organized around **clear responsibility boundaries**:

kernel/ → core OS logic and syscalls
scheduler/ → cooperative scheduler
vm/ → bytecode virtual machine
hal/ → hardware abstraction (per platform)
docs/ → specifications and implementation rules


Every subsystem is fully specified before implementation.

---

## 📜 License

UnForX is released under the **Apache License 2.0**.

This license allows:
- commercial and non-commercial use
- modification and redistribution
- use in proprietary systems

while providing:
- explicit attribution requirements
- patent protection for contributors
- long-term legal clarity for open collaboration

See the `LICENSE` file for the full text.

---

## 👤 Founder & Maintainer

**Jean Pierre Cordeiro**  
GitHub: [@JeanPCordeiro](https://github.com/JeanPCordeiro)

---

## 🚧 Project Status

UnForX is currently in **active development**.

The architecture and specifications are frozen.  
Implementation is proceeding phase by phase.

Contributions are welcome **once the implementation phases begin**.

---

## ⭐ Final Note

UnForX is not trying to replace Linux.  
It is not trying to be POSIX.  
It is not trying to be everything.

It is trying to be **correct, portable, and understandable**.

If that resonates with you — welcome.
