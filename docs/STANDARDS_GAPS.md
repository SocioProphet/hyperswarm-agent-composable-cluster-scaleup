# Standards Gaps

This file tracks gaps against the SocioProphet storage standards that could not be fully
verified or remediated in the current change set.

## Current Status
A baseline standards alignment narrative exists in `docs/SPECIFICATION.md` and a downstream
integration checklist now exists in `docs/INTEGRATION.md`.

## Open Issues
1. **Authoritative standards checklist is not embedded here**
   - **Gap:** This repository still depends on the canonical standards source in
     `SocioProphet/socioprophet-standards-storage` and does not embed a frozen requirement catalog.
   - **Impact:** Requirement-by-requirement compliance audits still require cross-referencing the
     upstream standards repository.
   - **Remediation:** Add a versioned standards crosswalk table keyed to a specific upstream commit
     hash from `socioprophet-standards-storage`.

2. **Machine-readable control mapping**
   - **Gap:** Standards alignment is documented narratively, but no machine-readable control map
     (JSON/YAML) is provided for automated compliance checks.
   - **Impact:** Automated governance systems cannot yet consume fine-grained control assertions.
   - **Remediation:** Add `docs/standards-crosswalk.json` and validate required control IDs in
     `tools/validate.py`.
