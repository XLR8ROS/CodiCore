# Local Memory Contract metadata

This file is not governing contract text.

- Agent repository: XLR8ROS/CodiCore
- Authoritative source: `/Users/reginaldberry/XOS-GitHub/XLR8ROS/xlr8ros-hq/Global Memory Contract.md`
- Governing local file: `Global Memory Contract.md`
- Verified canonical SHA-256: `f75e34d5cb2350eebd88028324e7ce63f3f37821748e2b7f285684575b3b2f62`
- Synchronization mechanism: `/Users/reginaldberry/XOS-GitHub/XLR8ROS/CodiCore/tools/xos_clone_global_memory_contract.sh`
- Synchronization policy: exact local clone from HQ canonical source; atomic copy; post-write SHA-256 verification.
- Technical lock mechanism: macOS user immutable flag `uchg` on the local governing copy between authorized synchronizations.
- Authorized update sequence: `chflags nouchg` → verified exact clone → `chflags uchg` → verify hash and flag.
- Lock verification: VERIFIED on 2026-10-05. `ls -lO` reported `uchg`; a direct write attempt under the agent host user failed with `PermissionError: [Errno 1] Operation not permitted`.
- Enforcement scope: protects against ordinary modification, replacement, and deletion while `uchg` is set. A process with authority to clear the user immutable flag can intentionally unlock it; the approved clone/rollback tools are the documented normal unlock path.
- Current equality: VERIFIED at SHA-256 `f75e34d5cb2350eebd88028324e7ce63f3f37821748e2b7f285684575b3b2f62` for HQ, NexCore, AddisonCore, EddieCore, CodiCore, and PaigeCore.
- Receipt date: 2026-10-05 America/New_York.
