list-tasks:
  @just --list

alias c := check
alias cp := check-and-push
alias fc := format-and-check
alias f := format

# Update all dependencies
update-deps:
  uv sync --upgrade
  uv run prek update
  uvx sync-with-uv
  uv run prek run -a sync-pre-commit-deps

# Setup the project. Needed after cloning
prepare:
  uv run prek install --install-hooks

check-and-push:
  [ -z "$(git status --porcelain)" ]
  just check
  git push --follow-tags

format-and-check:
  just format
  just check

# Run all code quality checks and tests, except pylint
check:
  uv run prek run --all-files

# Format code and files
format: sync
  just isort
  uv run ruff format
  uv run prek run --all-files mdformat

# Sort imports (using ruff)
isort: sync
  uv run ruff check --select I001 --fix

# Run linters: ruff
lint: sync
  uv run ruff check

# Sync python and notebook files
sync:
  jupytext --sync
