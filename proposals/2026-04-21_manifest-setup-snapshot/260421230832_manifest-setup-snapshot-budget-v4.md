# Part A

A1 Title: Manifest install, wiring, verification, and restore budget, compound engineering version

A2 Description: Manifest is installed as an OpenClaw plugin at `~/.openclaw/extensions/manifest/`. Persistent state lives in `~/.openclaw/manifest/config.json` and `~/.openclaw/manifest/manifest.db`. The work is to confirm or reinstall that plugin, wire `models.providers.manifest`, verify the dashboard at `http://127.0.0.1:2099`, and create a reusable snapshot/restore bundle plus replay procedure.

Success condition: the install path is explicit, the config and DB location are known, the dashboard and routing verify correctly, the restore path is proven, and reusable artifacts are left behind for the next run.

# Part B

B1
- Task: Inspect the current Manifest/OpenClaw runtime and extract reusable patterns
- Dependency: none
- Sub-agents: 1
- Effort time: 10 min
- Wall time: 10 min
- Input tokens: 1,500
- Input token cost: $0.00263
- Output tokens: 300
- Output token cost: $0.00270
- Total task cost: $0.00533

B2
- Task: Confirm install state and reinstall/restore Manifest at `~/.openclaw/extensions/manifest/`
- Dependency: B1
- Sub-agents: 1
- Effort time: 15 min
- Wall time: 15 min
- Install / restore command: `openclaw plugins install manifest` then `openclaw gateway restart`
- Input tokens: 2,500
- Input token cost: $0.00438
- Output tokens: 400
- Output token cost: $0.00360
- Total task cost: $0.00798

B3
- Task: Wire `models.providers.manifest` and normalize the routing template against `~/.openclaw/manifest/config.json`
- Dependency: B2
- Sub-agents: 2
- Effort time: 10 min
- Wall time: 5 min
- Parallel split: config edit, provider reference check
- Note: pre-staged during B2 so most of the work is hidden under the restore window
- Input tokens: 2,000
- Input token cost: $0.00350
- Output tokens: 400
- Output token cost: $0.00360
- Total task cost: $0.00710

B4
- Task: Parallel verification pack for plugin path, dashboard, and routing probes
- Dependency: B3
- Sub-agents: 3
- Effort time: 15 min
- Wall time: 4 min
- Parallel split: install-path check, dashboard check, route/smoke-test probe
- Note: pre-staged during B2 and finalized immediately after wiring lands
- Input tokens: 2,500
- Input token cost: $0.00438
- Output tokens: 600
- Output token cost: $0.00540
- Total task cost: $0.00978

B5
- Task: Create snapshot/restore bundle and validate replay procedure
- Dependency: B3 for snapshot capture, B4 for restore validation
- Sub-agents: 2
- Effort time: 15 min
- Wall time: 6 min
- Parallel split: snapshot bundle creation, restore-path validation
- Note: bundle must include `~/.openclaw/extensions/manifest/`, `~/.openclaw/manifest/config.json`, `~/.openclaw/manifest/manifest.db`, and the replay steps
- Input tokens: 2,500
- Input token cost: $0.00438
- Output tokens: 600
- Output token cost: $0.00540
- Total task cost: $0.00978

# Part C

- Total input tokens: 11,000
- Total input cost: $0.01927
- Total output tokens: 2,300
- Total output cost: $0.02070
- Total effort time: 65 min
- Total wall-clock time: 26 min
- Overall total sub-agent cost: $0.03997

# Reusable capability created

- exact install path map
- install / restore sequence
- provider wiring template
- verification checklist
- known-good snapshot
- restore / replay procedure
- reusable Manifest setup pattern for future jobs
