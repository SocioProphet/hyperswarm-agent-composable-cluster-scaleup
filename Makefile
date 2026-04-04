.PHONY: help validate fetch

help: ## List available tasks and their descriptions.
	@awk 'BEGIN {FS = ":.*##"; printf "Available tasks:\n"} /^[a-zA-Z0-9_.-]+:.*##/ {printf "  %-12s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

validate: ## Validate repository standards and upstream references.
	python3 tools/validate.py

fetch: ## Fetch upstream source artifacts used by this repository.
	bash tools/fetch_upstreams.sh
