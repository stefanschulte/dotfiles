FROM mcr.microsoft.com/devcontainers/base:latest

ENV LANG=C.UTF-8

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
