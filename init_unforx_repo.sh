#!/usr/bin/env bash

set -e

echo "Initializing UnForX repository structure..."

create_file() {
  local file="$1"
  mkdir -p "$(dirname "$file")"
  if [ ! -f "$file" ]; then
    echo "PASTE AUTHORITATIVE CONTENT HERE" > "$file"
    echo "Created $file"
  else
    echo "Skipped existing $file"
  fi
}

# Root
create_file README.md
create_file GOVERNANCE.md
create_file AUTHORS.md
create_file CONTRIBUTING.md
create_file CODING_GUIDELINES.md
create_file IMPLEMENTATION_CHECKLIST.md

# Docs
create_file docs/ARCHITECTURE_FREEZE.md
create_file docs/BUILD.md
create_file docs/TESTING_STRATEGY.md
create_file docs/LLM_IMPLEMENTATION_GUIDE.md
create_file docs/LLM_IMPLEMENTATION_PLAYBOOK.md
create_file docs/LLM_STOP_CONDITIONS.md

create_file docs/build/UBUNTU_SETUP.md
create_file docs/build/PREREQUISITES.md
create_file docs/build/COMMON_ERRORS.md

# Kernel core
create_file kernel/BOOT_SEQUENCE.md
create_file kernel/PANIC_AND_FATAL_ERRORS.md
create_file kernel/LOGGING_POLICY.md
create_file kernel/CONSOLE_CONNECTION_POLICY.md
create_file kernel/INTERRUPT_POLICY.md

# Kernel console
create_file kernel/console/README.md
create_file kernel/console/CONSOLE_OVERVIEW.md
create_file kernel/console/CONSOLE_EXECUTION_MODEL.md
create_file kernel/console/ANSI_TERMINAL_SPEC.md
create_file kernel/console/SCREEN_BUFFER_SPEC.md
create_file kernel/console/INPUT_QUEUE_AND_KEY_HANDLING_SPEC.md
create_file kernel/console/console_syscall_numbers.h

# Kernel filesystem
create_file kernel/fs/README.md
create_file kernel/fs/FAT32_SPEC.md
create_file kernel/fs/FATFS_ADAPTER_AND_FFCONF_SPEC.md

# Kernel networking
create_file kernel/net/README.md
create_file kernel/net/NETWORKING_OVERVIEW.md
create_file kernel/net/NET_EXECUTION_MODEL.md
create_file kernel/net/NET_SOCKET_MODEL.md
create_file kernel/net/NET_PROTOCOL_STACK.md
create_file kernel/net/NET_SYSCALL_SPEC.md
create_file kernel/net/net_syscall_numbers.h

# Kernel memory & errors
create_file kernel/memory/MEMORY_MODEL.md
create_file kernel/errors/ERROR_CODES.md
create_file kernel/errors/ERROR_CODE_OWNERSHIP.md

# Kernel syscalls
create_file kernel/syscall/SYSCALL_BLOCKING_MATRIX.md

# Scheduler
create_file scheduler/README.md
create_file scheduler/TASK_LIFECYCLE.md
create_file scheduler/MAIN_LOOP_OWNERSHIP.md

# VM
create_file vm/UNFORX_VM_BYTECODE_SPEC.md
create_file vm/VM_MEMORY_MODEL.md
create_file vm/INITIAL_PROGRAM_CONVENTION.md

# HAL
create_file hal/README.md
create_file hal/TIME_SOURCE_SPEC.md

create_file hal/rp2350/README.md
create_file hal/rp2350/BUILD.md

create_file hal/esp32/README.md
create_file hal/esp32/BUILD.md

create_file hal/rpi/README.md
create_file hal/rpi/BUILD.md

create_file hal/x86/README.md
create_file hal/x86/BUILD.md

echo "UnForX repository skeleton (FINAL) created successfully."
echo "Paste authoritative specification content file by file."
