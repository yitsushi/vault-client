# Vault Client (Docker)

This repo is for mostly personal usage. Of course anyone can use the repo, or
all available published images in any way they want.

## Base images

The base image contains only the vault binary in an alpine based image. It could
be the official vault image[^1], but I have no control over that image. The
official one is prepared to be used as server and client and everything. I don't
want that. The whole cleanup (`gpg` and `openssl` packages), the extra volumes,
exposed port, `entrypoint` and `cmd` instructions.

[^1]: https://github.com/hashicorp/docker-vault

## Nvim images

The `nvim` image has only one addition to the base image, and it's (surprise)
Neovim. This image is there mostly to test how the whole build procedure works
with the base image and child images.
