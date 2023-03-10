.PHONY: install
install: ## Install the poetry environment and install the pre-commit hooks
	@echo "🚀 Creating virtual environment using pyenv and poetry"
	@poetry install
	@poetry run --quiet pre-commit install
	@poetry shell

.PHONY: check
check: ## Run code quality tools.
	@echo "🚀 Checking Poetry lock file consistency with 'pyproject.toml': Running poetry lock --check"
	@poetry lock --check
	@echo "🚀 Linting code: Running pre-commit"
	@poetry run pre-commit run -a
{%- if cookiecutter.deptry == 'y' %}
	@echo "🚀 Checking for obsolete dependencies: Running deptry"
	@poetry run deptry .
{%- endif %}

.PHONY: test
test: ## Test the code with pytest
	@echo "🚀 Testing code: Running pytest"
	@poetry run pytest

.PHONY: clean
clean: ## clean build artifacts
	@echo "🚀 Cleaning up build artifacts and cache files"
	@rm -rf dist
	@find . -type d -iname .ipynb_checkpoints -exec rm -r {} +
	@rm -rf .pytest_cache


.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
