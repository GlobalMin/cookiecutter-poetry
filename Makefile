.PHONY: wipe-all
wipe-all: ## wipe the virtual environment
	@echo "🚀 Wiping virtual environment"
	@rm -rf .venv
	@rm -rf .tox


.PHONY: bake
bake: ## bake without inputs and overwrite if exists.
	@cookiecutter --no-input . --overwrite-if-exists

.PHONY: bake-with-inputs
bake-with-inputs: ## bake with inputs and overwrite if exists.
	@cookiecutter . --overwrite-if-exists

.PHONY: cookie
cookie: ## bake without inputs and overwrite if exists.
	@cd .. && rm -rf example-project && cookiecutter --no-input --overwrite-if-exists cookiecutter-poetry && code example-project

.PHONY: bake-and-test-deploy
bake-and-test-deploy:
	@rm -rf cookiecutter-poetry-example || true
	@cookiecutter --no-input . --overwrite-if-exists \
		author="Florian Maas" \
		email="fpgmaas@gmail.com" \
		github_author_handle=fpgmaas \
		project_name=cookiecutter-poetry-example \
		project_slug=cookiecutter_poetry_example
	@cd cookiecutter-poetry-example; poetry lock && \
		git init -b main && \
		git add . && \
		git commit -m "init commit" && \
		git remote add origin git@github.com:fpgmaas/cookiecutter-poetry-example.git && \
		git push -f origin main


.PHONY: install
install: ## Install the poetry environment
	@echo "🚀 Creating virtual environment using pyenv and poetry"
	@poetry install
	@poetry shell

.PHONY: check
check: ## Run code quality tools.
	@echo "🚀 Checking Poetry lock file consistency with 'pyproject.toml': Running poetry lock --check"
	@poetry lock --check
	@echo "🚀 Linting code: Running pre-commit"
	@poetry run pre-commit run -a
	@echo "🚀 Linting with ruff"
	@poetry run ruff hooks tests cookiecutter_poetry --config pyproject.toml
	@echo "🚀 Checking for obsolete dependencies: Running deptry"
	@poetry run deptry .

.PHONY: test
test: ## Test the code with pytest.
	@echo "🚀 Testing code: Running pytest"
	@poetry run pytest tests

.PHONY: build
build: clean-build ## Build wheel file using poetry
	@echo "🚀 Creating wheel file"
	@poetry build

.PHONY: clean-build
clean-build: ## clean build artifacts
	@rm -rf dist

.PHONY: clean
clean: ## clean build artifacts
	@echo "🚀 Cleaning up build artifacts and cache files"
	@rm -rf dist
	@rm -rf .mypy_cache
	@rm -rf .pytest_cache
	@rm -rf .coverage
	@rm -rf example-project
	@find . -type d -iname __pycache__ -exec rm -r {} +


.PHONY: docs-test
docs-test: ## Test if documentation can be built without warnings or errors
	@mkdocs build -s

.PHONY: docs
docs: ## Build and serve the documentation
	@mkdocs serve

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
