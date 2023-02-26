# Vault Client (Docker)

This repo is for mostly personal usage. Of course anyone can use the repo, or
all available published images in any way they want.

## How I use it

```bash
#!/usr/bin/env zsh

# This script is called: vault-client

# This directory is the persistent home directory with token and other stuffs.
# Note: It can be a docker volume, so it does not necessarily have to be a local
# directory.
local vaultHome="${HOME}/.docker-dirs/vault/home"
# This is defined here only because I like saving these kind of things in
# variables so I can change them easily if required.
local userHome="/home/vault"
# Image to use. If you check the Makefile you can see I use different
# registries, for example a local one. It's easier to change the value here.
local image="ghcr.io/yitsushi/vault-client/nvim"

# Create the persistent home directory is required.
# Ignore if it's a docker volume.
test -d "${vaultHome}" || mkdir -p "${vaultHome}"

docker run \
  --rm \
  -it \
  -v "${vaultHome}:${userHome}" \
  -e VAULT_ADDR \
  "${image}" \
  /bin/ash
```

## Base images

The base image contains only the vault binary in an alpine based image. It could
be the official vault image[^1], but I have no control over that image. The
official one is prepared to be used as server and client and everything. I don't
want that. The whole cleanup (`gpg` and `openssl` packages), the extra volumes,
exposed port, `entrypoint` and `cmd` instructions.

```bash
local image="ghcr.io/yitsushi/vault-client/base"
```

[^1]: https://github.com/hashicorp/docker-vault

## Nvim images

The `nvim` image has only one addition to the base image, and it's (surprise)
Neovim. This image is there mostly to test how the whole build procedure works
with the base image and child images.

```bash
local image="ghcr.io/yitsushi/vault-client/nvim"
```
