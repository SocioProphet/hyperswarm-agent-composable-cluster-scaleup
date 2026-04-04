# Integration Playbook

This playbook describes how to integrate the HyperSwarm cluster scale-up wrapper into the
wider SocioProphet workspace while preserving deterministic upstream pinning and governance.

## Integration goals
- Keep upstream versions centralized in `tools/upstreams.env`.
- Ensure downstream repos consume this wrapper as a dependency, not as a fork.
- Enforce wrapper validation (`make validate`) in cross-repo CI gates.

## Integration targets

### 1) prophet-platform (primary consumer)
**Repository:** `SocioProphet/prophet-platform`

Actions:
1. Add this repository to infra architecture docs as the canonical source for scale-up upstream pinning.
2. Reference `make fetch` as the mechanism to hydrate `third_party/` during platform bootstrap.
3. Add a CI step that runs this wrapper's `make validate` before release cut or environment promotion.

Suggested CI invocation:
```bash
git clone <this-wrapper-repo>
cd hyperswarm-agent-composable-cluster-scaleup
make validate
```

### 2) sociosphere (governance and inventory)
**Repository:** `SocioProphet/sociosphere`

Actions:
1. Add this wrapper to dependency inventory metadata.
2. Gate dependency changes by requiring updates to `tools/upstreams.env` plus rationale updates in `docs/UPSTREAMS.md`.
3. Add a policy check that fails when refs are floating (except explicit allowlist entries).

### 3) tritrpc (protocol contract linkage)
**Repository:** `SocioProphet/tritrpc`

Actions:
1. Keep triRPC protocol ownership in `tritrpc`; do not duplicate contracts in this wrapper.
2. When cluster automation contracts evolve, document compatibility notes in this wrapper's `docs/SPECIFICATION.md`.
3. Treat wrapper changes as implementation-level integration details rather than protocol changes.

## Operational flow
1. Update pinned versions in `tools/upstreams.env`.
2. Update rationale in `docs/UPSTREAMS.md`.
3. Run `make fetch` to verify refs are available.
4. Run `make validate` to confirm repository guardrails.
5. Promote changes downstream in `prophet-platform` and register governance deltas in `sociosphere`.

## Evidence checklist for PRs
- [ ] `tools/upstreams.env` updated (if pins changed).
- [ ] `docs/UPSTREAMS.md` rationale updated.
- [ ] `make validate` succeeds.
- [ ] Integration references updated in downstream docs/CI (where applicable).

## Non-goals
- Executing provisioning against live clusters from this repository.
- Storing environment secrets or credentials.
- Owning canonical protocol contracts (owned by `tritrpc`).
