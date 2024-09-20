{{ if eq .chezmoi.os "darwin" -}}
# Expose the 1password ssh agent socket. Doing it via env variable is required to make it work in devcontainers.
# The identityfile directive in ssh config does not get forwarded into the container.
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
{{ end -}}
