## Configuration
## =============

# Parameters
# ----------

# Reproducible and stable results by default
export SOURCE_DATE_EPOCH ?= 0

# Other
# -----

# Have zero effect by default to prevent accidental changes.
.DEFAULT_GOAL := help

# Delete targets that fail to prevent subsequent attempts incorrectly assuming
# the target is up to date.
.DELETE_ON_ERROR: ;

# Don't remove intermediate files.
.SECONDARY:

# Prevent pesky default rules from creating unexpected dependency graphs.
.SUFFIXES: ;

# Rebuild targets when marking them as phony directly is not enough.
FORCE:;
.PHONY: FORCE

## Verbs
## =====

help:
	@mkhelp $(firstword $(MAKEFILE_LIST))

## Checks
## ------

## Run all checks
check_all: check_generated_files check_other
.PHONY: check_all

## Run all checks except generated files
check_other: check_build check_docs check_format check_lint check_tests
.PHONY: check_other

## Check that all crates can be built
check_build:
	cargo build \
		--locked \
		--workspace
.PHONY: check_build

## Check that docs can be built
check_docs:
	RUSTDOCFLAGS="-Dwarnings" cargo doc \
		--document-private-items \
		--locked \
		--no-deps \
		--workspace
.PHONY: check_docs

## Check that the code is formatted correctly
check_format:
	cargo fmt \
		--check \
		-- \
		--config imports_granularity=Crate,group_imports=StdExternalCrate
.PHONY: check_format

## Check that generated files are up to date
check_generated_files: Cargo.lock
	git update-index -q --refresh
	git --no-pager diff --exit-code HEAD -- $^
.PHONY: check_generated_files

## Check that the code is free of lints
check_lint:
	cargo clippy \
		--all-targets \
		--locked \
		--no-deps \
		--workspace \
		-- \
		-Dwarnings
.PHONY: check_lint

## Check that the tests pass
check_tests:
	cargo test \
		--locked \
		--workspace
.PHONY: check_tests

## Fixes
## -----

## Attempt to fix formatting automatically
fix_format:
	cargo fmt \
		-- \
		--config imports_granularity=Crate,group_imports=StdExternalCrate
.PHONY: fix_format

## Attempt to fix lints automatically
fix_lint:
	cargo clippy --fix
.PHONY: fix_lint


## Nouns
## =====

Cargo.lock: FORCE
	cargo metadata > /dev/null
