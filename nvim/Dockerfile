arg BASE_IMAGE
arg VAULT_VERSION

from --platform=$BUILDPLATFORM ${BASE_IMAGE}:${VAULT_VERSION}

user root

run apk add --no-cache neovim

user vault
