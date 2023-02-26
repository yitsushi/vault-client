REGISTRY=ghcr.io
IMAGE=yitsushi/vault-client
TAG=1.12.3
BUILDX_BUILDER=container

.PHONY: base
base:
	cd base && $(MAKE) push TAG=$(TAG)

.PHONY: nvim
nvim:
	cd nvim && $(MAKE) push TAG=$(TAG)

base-local: REGISTRY=registry.gitops.efertone.me
base-local: IMAGE=efertone/vault-client
base-local: base

nvim-local: REGISTRY=registry.gitops.efertone.me
nvim-local: IMAGE=efertone/vault-client
nvim-local: base
