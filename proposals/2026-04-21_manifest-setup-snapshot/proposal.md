# Manifest Setup / Snapshot Proposal

1. Request or dependency: Reinstall or restore Manifest, then wire `models.providers.manifest` and snapshot the working state.
2. Reason: restore the embedded Manifest server, keep routing stable, and preserve a reusable setup so it does not need to be reconfigured from scratch.
3. Required format: exact install command(s), restart/apply step, verification of dashboard and routing, plus a snapshot/restore bundle of the working config.
4. Due condition or due time: about 5 to 15 minutes if the current state is intact, 15 to 30 minutes if a clean reinstall is needed.
5. Current owner: Codi.
6. Next-step owner: Codi after approval, or Reg if a path/credential decision is needed.
