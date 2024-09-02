# TODO: pin sha hash for immutable image version
FROM mcr.microsoft.com/devcontainers/base:jammy
# TODO: Have a packer build for a general purpose devops image that installs support tooling as well as version manager for most software, so that pinned versions can be installed via dockerfiles
ENV LANG=C.UTF-8

# TODO: doesn't work
# Remove the annoying Docker advertisement messages after every command
ENV DOCKER_CLI_HINTS=false

# Install Viega PKI root certs
# Make sure ruby apps use global trust store
ENV SSL_CERT_FILE="/etc/ssl/certs/ca-certificates.crt"
# Make sure curl uses global trust store
ENV CURL_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt"
# Make sure nodejs apps use global trust store
ENV NODE_EXTRA_CA_CERTS="/etc/ssl/certs/ca-certificates.crt"
# Make sure python apps use global trust store
ENV REQUESTS_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt"

# Build this as vscode non-root user
USER vscode

# Update CA bundle
RUN : \
  && sudo curl -o /usr/local/share/ca-certificates/zscaler-root-ca.crt http://crl.viega.com/zscaler-root-ca.crt \
  && sudo curl -o /usr/local/share/ca-certificates/viega-root-2035.crt http://crl.viega.com/vsatn-root-ca-1_VIEGA%20Root%20CA%202012\(1\).crt \
  && sudo update-ca-certificates \
  && :

# Install pipx
RUN : \
  # Set up hashicorp repo for packer package installation
  && wget -qO - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg 1> /dev/null \
  && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list \
  # Set up prebuilt-mpr repo for just package installation
  && wget -qO - 'https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub' | gpg --dearmor | sudo tee /usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg 1> /dev/null \
  && echo "deb [arch=all,$(dpkg --print-architecture) signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr $(lsb_release -cs)" | sudo tee /etc/apt/sources.list.d/prebuilt-mpr.list \
  && sudo apt-get update \
	&& DEBIAN_FRONTEND=noninteractive sudo apt-get install -y \
		--no-install-recommends \
    # TODO: Pin installed versions (using what for update checks? renovate bot?)
		pipx \
    packer \
    # TODO: setup shell completions for just
    just \
    fzf \
    # TODO: add github cli
  && pipx ensurepath \
  && packer -autocomplete-install \
	&& :

# Install ansible tooling and commit hooks
# TODO: use Ansible execution engine instead of locally installed ansible? Or provide latest ansible version plus pinned execution engine version?
RUN : \
  #&& pipx install --include-deps ansible-dev-tools \
  && pipx install --include-deps ansible-core==2.16.9 \
  && pipx install --include-deps ansible-lint \
  && pipx install --include-deps pre-commit \
  && :
