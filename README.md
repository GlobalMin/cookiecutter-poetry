
> ## <center>This is a fork of [this original repo](https://github.com/fpgmaas/cookiecutter-poetry). </center>
>
<p align="center">
  <img width="600" src="https://raw.githubusercontent.com/fpgmaas/cookiecutter-poetry/main/docs/static/cookiecutter.svg">
</p style = "margin-bottom: 2rem;">

---

[![Release](https://img.shields.io/github/v/release/fpgmaas/cookiecutter-poetry)](https://pypi.org/project/cookiecutter-poetry/)
[![Build status](https://img.shields.io/github/actions/workflow/status/fpgmaas/cookiecutter-poetry/main.yml?branch=main)](https://github.com/fpgmaas/cookiecutter-poetry/actions/workflows/main.yml?query=branch%3Amain)
[![Supported Python versions](https://img.shields.io/pypi/pyversions/cookiecutter-poetry)](https://pypi.org/project/cookiecutter-poetry/)
[![Docs](https://img.shields.io/badge/docs-gh--pages-blue)](https://fpgmaas.github.io/cookiecutter-poetry/)
[![License](https://img.shields.io/github/license/fpgmaas/cookiecutter-poetry)](https://img.shields.io/github/license/fpgmaas/cookiecutter-poetry)


This is a modern Cookiecutter template that can be used to initiate a Python project with all the necessary tools for development, testing, and deployment. It supports the following features:

- [Poetry](https://python-poetry.org/) for dependency management
- CI/CD with [GitHub Actions](https://github.com/features/actions)
- Pre-commit hooks with [pre-commit](https://pre-commit.com/)
- Code quality with [black](https://pypi.org/project/black/), [ruff](https://github.com/charliermarsh/ruff), [mypy](https://mypy.readthedocs.io/en/stable/), and [deptry](https://github.com/fpgmaas/deptry/)
- Publishing to [Pypi](https://pypi.org) or [Artifactory](https://jfrog.com/artifactory) by creating a new release on GitHub
- Testing and coverage with [pytest](https://docs.pytest.org/en/7.1.x/) and [codecov](https://about.codecov.io/)
- Documentation with [MkDocs](https://www.mkdocs.org/)
- Compatibility testing for multiple versions of Python with [Tox](https://tox.wiki/en/latest/)
- Containerization with [Docker](https://www.docker.com/)