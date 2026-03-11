# AGENTS

This project uses **uv** as its Python package and project manager.[web:2][web:8]
Always use `uv` (not `pip`, `poetry`, or `conda`) for installing dependencies, running commands, and managing virtual environments.[web:2][web:6][web:15]

Details of the setup can be found in the `pyproject.toml` file.

## How to set up

- Ensure `uv` is installed (see installation instructions in the official docs).[web:2]
- Clone the repository, then in the project root run:
  - `uv sync` to create the virtual environment and install all dependencies from `pyproject.toml` and `uv.lock`.[web:6][web:15]

After this, all project commands should be run via `uv run`.

## Common commands

From the project root:

- Run tests:
  - `make test_unit`
- Lint:
  - `make lint`
- Run type check:
  - `make type_check`

## Dependency management

Do not edit `uv.lock` by hand.[web:6][web:15]

- Add runtime dependencies:
  - `uv add package_name`[web:6][web:8]
- Add development-only dependencies:
  - `uv add --dev package_name`[web:6]
- Remove a dependency:
  - `uv remove package_name`[web:6]
- Update locked versions:
  - `uv lock --upgrade`[web:6][web:15]

These commands will update `pyproject.toml` and `uv.lock` as needed.[web:4][web:8][web:15]

## Virtual environments

`uv` manages the virtual environment automatically; you normally do not need to activate it manually.[web:2][web:6]

If you must activate it:

- Unix: `source .venv/bin/activate`

Otherwise, prefer using `uv run ...` so commands run in the project environment without explicit activation.[web:2][web:6]

## Single‑file agent scripts (optional)

For standalone “agent” scripts, you can declare dependencies inline using PEP 723 metadata so they run anywhere with just `uv` installed.[web:2][web:5]

Example:

```python
# /// script
# requires-python = ">=3.11"
# dependencies = [
#   "requests>=2.32.0",
#   "markdown>=3.6",
# ]
# ///
import requests
import markdown

# your agent code here

