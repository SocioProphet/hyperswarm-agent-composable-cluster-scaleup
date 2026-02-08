# HyperSwarm Agent Composable Cluster — Scale-Up Wrapper

**Tagline:** A reproducible, policy-forward wrapper that pins upstream scale-up primitives for SocioProphet's cluster expansion workflows.

## Repository description (pedantic)
This repository provides the **HyperSwarm Agent Composable Cluster — Scale-Up Wrapper**, a SocioProphet integration layer that orchestrates reproducible cluster scale-up primitives by pinning and validating upstream sources rather than vendoring them directly. The repository exists to define how upstream tooling is fetched, validated, and contextualized against SocioProphet's canonical standards and governance controls. It is intentionally minimal: it wires provenance, validation gates, and documentation for upstreams without forking or embedding their source by default.

## Topics
hyper-swarm, hyperswarm, agent, composable, cluster, scale-up, kubernetes, k8s, kubespray, krew, provisioning, automation, reproducibility, supply-chain, security, policy, governance, sociprophet, sociosphere, tritrpc, standards, storage, infrastructure, devops, platform, wrapper

This repository is a **SocioProphet integration wrapper** for cluster scale-up primitives.
It does **not** vendor third-party sources by default; instead it pins upstream versions
and fetches them into `third_party/` for reproducibility and license correctness.

## Truth hierarchy (linkages)
- Platform integration target: `SocioProphet/prophet-platform`
- Workspace governance + cross-repo validation: `SocioProphet/sociosphere`
- Canonical protocol contracts: `SocioProphet/tritrpc`
- Storage/graph standards: `SocioProphet/socioprophet-standards-storage`

## What gets fetched (pinned upstreams)
- kubespray (Kubernetes cluster provisioning)
- krew (kubectl plugin manager)
- heroku-buildpack-apt (legacy reference only; not required; no releases upstream)

## Documentation
- Specification: `docs/SPECIFICATION.md`
- Upstream rationale: `docs/UPSTREAMS.md`
- Standards gaps/issues: `docs/STANDARDS_GAPS.md`

## License and notices
- License: MIT (see `LICENSE`).
- Notices: `NOTICE.md` enumerates relevant acknowledgements and policy notes.

## Security policy
- The security policy for this repository is documented in `SECURITY.md`, including supported versions and the vulnerability reporting process.

## Related repositories
The wrapper maps to and validates against the following SocioProphet repositories:
- `SocioProphet/prophet-platform` (platform integration target)
- `SocioProphet/sociosphere` (workspace governance + cross-repo validation)
- `SocioProphet/tritrpc` (canonical protocol contracts)
- `SocioProphet/socioprophet-standards-storage` (storage/graph standards)

## Related upstreams (pinned, not vendored)
- kubespray — Kubernetes cluster provisioning toolkit.
- krew — kubectl plugin manager for extending operational workflows.
- heroku-buildpack-apt — legacy reference only; not required; no releases upstream.

## Quickstart
1) Fetch upstreams:
   - `make fetch`
2) Validate repo gates:
   - `make validate`

## Non-goals
- We do not ship secrets.
- We do not fork canonical specs here (triRPC remains canonical upstream).
