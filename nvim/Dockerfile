arg BASE_IMAGE
arg VAULT_VERSION

from --platform=$BUILDPLATFORM ${BASE_IMAGE}:${VAULT_VERSION}

label org.opencontainers.image.source=https://github.com/yitsushi/vault-client

user root

run apk add --no-cache neovim

user vault
