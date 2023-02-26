REGISTRY=ghcr.io
IMAGE=yitsushi/vault-client
TAG=latest
BUILDX_BUILDER=container
NAME=nvim

.PHONY: build
build: buildx-context
	docker buildx build \
		--platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
		--build-arg BASE_IMAGE="$(REGISTRY)/$(IMAGE)" \
		--build-arg VAULT_VERSION="$(TAG)" \
		--tag "$(REGISTRY)/$(IMAGE):$(NAME)-$(TAG)" \
		--builder "$(BUILDX_BUILDER)" .

.PHONY: push
push: build
	docker buildx build \
		--platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
		--push \
		--build-arg BASE_IMAGE="$(REGISTRY)/$(IMAGE)" \
		--build-arg VAULT_VERSION="$(TAG)" \
		--tag "$(REGISTRY)/$(IMAGE):$(NAME)-$(TAG)" \
		--tag "$(REGISTRY)/$(IMAGE):$(NAME)" \
		--builder "$(BUILDX_BUILDER)" .

.PHONY: buildx-context
buildx-context:
	docker buildx inspect "$(BUILDX_BUILDER)" >/dev/null 2>&1 \
		|| docker buildx create \
				--name "$(BUILDX_BUILDER)" \
				--driver docker-container
