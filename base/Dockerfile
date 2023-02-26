from --platform=$BUILDPLATFORM alpine:3.17

ARG VAULT_VERSION=unknown
ARG USER_ID=1000
ARG GROUP_ID=1000

# Create vault user and group
run addgroup vault -g "${GROUP_ID}" \
  && adduser -h /home/vault -u "${USER_ID}" -D -G vault vault

# Install sudo and basic tools
run apk add --no-cache \
  sudo curl ca-certificates gnupg openssl tzdata

# Add vault binary
run case $(apk --print-arch) in \
      armhf) ARCH='arm' ;; \
      aarch64) ARCH='arm64' ;; \
      x86_64) ARCH='amd64' ;; \
      x86) ARCH='386' ;; \
    esac; \
  VAULT_GPGKEY=C874011F0AB405110D02105534365D9472D7468F; \
  found=''; \
  for server in \
    hkps://keys.openpgp.org \
    hkps://keyserver.ubuntu.com \
    hkps://pgp.mit.edu; do \
      echo "Fetching GPG key $VAULT_GPGKEY from $server"; \
      gpg --batch --keyserver "$server" --recv-keys "$VAULT_GPGKEY" && found=yes && break; \
  done; \
  base="https://releases.hashicorp.com/vault/${VAULT_VERSION}"; \
  cd /tmp; \
  target="vault_${VAULT_VERSION}_linux_${ARCH}.zip"; \
  curl -sO "${base}/${target}"; \
  curl -sO "${base}/vault_${VAULT_VERSION}_SHA256SUMS"; \
  curl -sO "${base}/vault_${VAULT_VERSION}_SHA256SUMS.sig"; \
  gpg --batch --verify \
    vault_${VAULT_VERSION}_SHA256SUMS.sig \
    vault_${VAULT_VERSION}_SHA256SUMS \
  && grep ${target} vault_${VAULT_VERSION}_SHA256SUMS | sha256sum -c \
  && unzip "${target}" \
  && mv vault /usr/bin \
  && rm vault_*

volume ["/home/vault"]

user vault:vault
workdir /home/vault

copy vault.sudoers /etc/sudoers.d/vault
