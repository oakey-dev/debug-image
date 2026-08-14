FROM alpine:3.24.1

# Add this label to your Dockerfile
LABEL org.opencontainers.image.source=https://github.com/oakey-dev/debug-image

# Copy entrypoint script into the image
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# renovate: datasource=repology depName=alpine_3_24/atop versioning=loose
ENV ATOP_VERSION="2.12.1-r0"
# renovate: datasource=repology depName=alpine_3_24/bash versioning=loose
ENV BASH_VERSION="5.3.9-r1"
# renovate: datasource=repology depName=alpine_3_24/bash-completion versioning=loose
ENV BASH_COMPLETION_VERSION="2.17.0-r1"
# renovate: datasource=repology depName=alpine_3_24/bind-tools versioning=loose
ENV BIND_TOOLS_VERSION="9.20.26-r0"
# renovate: datasource=repology depName=alpine_3_24/btop versioning=loose
ENV BTOP_VERSION="1.4.6-r0"
# renovate: datasource=repology depName=alpine_3_24/ca-certificates versioning=loose
ENV CA_CERTIFICATES_VERSION="20260611-r0"
# renovate: datasource=repology depName=alpine_3_24/curl versioning=loose
ENV CURL_VERSION="8.21.0-r0"
# renovate: datasource=repology depName=alpine_3_24/ethtool versioning=loose
ENV ETHTOOL_VERSION="7.0-r0"
# renovate: datasource=repology depName=alpine_3_24/grml-zsh-config versioning=loose
ENV GRML_ZSH_CONFIG_VERSION="0.19.10-r0"
# renovate: datasource=repology depName=alpine_3_24/htop versioning=loose
ENV HTOP_VERSION="3.5.1-r1"
# renovate: datasource=repology depName=alpine_3_24/iftop versioning=loose
ENV IFTOP_VERSION="1.0_pre4-r0"
# renovate: datasource=repology depName=alpine_3_24/inxi versioning=loose
ENV INXI_VERSION="3.3.39.1-r0"
# renovate: datasource=repology depName=alpine_3_24/iotop versioning=loose
ENV IOTOP_VERSION="0.6-r14"
# renovate: datasource=repology depName=alpine_3_24/iperf3 versioning=loose
ENV IPERF3_VERSION="3.20-r0"
# renovate: datasource=repology depName=alpine_3_24/iproute2 versioning=loose
ENV IPROUTE2_VERSION="7.0.0-r0"
# renovate: datasource=repology depName=alpine_3_24/iputils versioning=loose
ENV IPUTILS_VERSION="20250605-r2"
# renovate: datasource=repology depName=alpine_3_24/jq versioning=loose
ENV JQ_VERSION="1.8.1-r0"
# renovate: datasource=repology depName=alpine_3_24/less versioning=loose
ENV LESS_VERSION="702-r0"
# renovate: datasource=repology depName=alpine_3_24/mtr versioning=loose
ENV MTR_VERSION="0.96-r2"
# renovate: datasource=repology depName=alpine_3_24/man-db versioning=loose
ENV MAN_DB_VERSION="2.13.1-r1"
# renovate: datasource=repology depName=alpine_3_24/man-pages versioning=loose
ENV MAN_PAGES_VERSION="6.18-r0"
# renovate: datasource=repology depName=alpine_3_24/neovim versioning=loose
ENV NEOVIM_VERSION="0.12.2-r0"
# renovate: datasource=repology depName=alpine_3_24/nmap versioning=loose
ENV NMAP_VERSION="7.99-r0"
# renovate: datasource=repology depName=alpine_3_24/python3 versioning=loose
ENV PYTHON3_VERSION="3.14.7-r0"
# renovate: datasource=repology depName=alpine_3_24/pstree versioning=loose
ENV PSTREE_VERSION="2.40-r2"
# renovate: datasource=repology depName=alpine_3_24/tcpdump versioning=loose
ENV TCPDUMP_VERSION="4.99.6-r1"
# renovate: datasource=repology depName=alpine_3_24/tmux versioning=loose
ENV TMUX_VERSION="3.6b-r0"
# renovate: datasource=repology depName=alpine_3_24/tree versioning=loose
ENV TREE_VERSION="2.3.2-r0"
# renovate: datasource=repology depName=alpine_3_24/vnstat versioning=loose
ENV VNSTAT_VERSION="2.13-r1"
# renovate: datasource=repology depName=alpine_3_24/wget versioning=loose
ENV WGET_VERSION="1.25.0-r3"
# renovate: datasource=repology depName=alpine_3_24/yq-go versioning=loose
ENV YQ_GO_VERSION="4.53.3-r0"
# renovate: datasource=repology depName=alpine_3_24/zsh versioning=loose
ENV ZSH_VERSION="5.9-r7"
# renovate: datasource=repology depName=alpine_3_24/zsh-completions versioning=loose
ENV ZSH_COMPLETIONS_VERSION="0.35.0-r0"

RUN apk update && apk add --no-cache \
    "atop=${ATOP_VERSION}" \
    "bash=${BASH_VERSION}" \
    "bash-completion=${BASH_COMPLETION_VERSION}" \
    "bind-tools=${BIND_TOOLS_VERSION}" \
    "btop=${BTOP_VERSION}" \
    "ca-certificates=${CA_CERTIFICATES_VERSION}" \
    "curl=${CURL_VERSION}" \
    "ethtool=${ETHTOOL_VERSION}" \
    "grml-zsh-config=${GRML_ZSH_CONFIG_VERSION}" \
    "htop=${HTOP_VERSION}" \
    "iftop=${IFTOP_VERSION}" \
    "inxi=${INXI_VERSION}" \
    "iotop=${IOTOP_VERSION}" \
    "iperf3=${IPERF3_VERSION}" \
    "iproute2=${IPROUTE2_VERSION}" \
    "iputils=${IPUTILS_VERSION}" \
    "jq=${JQ_VERSION}" \
    "less=${LESS_VERSION}" \
    "man-db=${MAN_DB_VERSION}" \
    "man-pages=${MAN_PAGES_VERSION}" \
    "mtr=${MTR_VERSION}" \
    "neovim=${NEOVIM_VERSION}" \
    "nmap=${NMAP_VERSION}" \
    "pstree=${PSTREE_VERSION}" \
    "python3=${PYTHON3_VERSION}" \
    "tcpdump=${TCPDUMP_VERSION}" \
    "tmux=${TMUX_VERSION}" \
    "tree=${TREE_VERSION}" \
    "vnstat=${VNSTAT_VERSION}" \
    "wget=${WGET_VERSION}" \
    "yq-go=${YQ_GO_VERSION}" \
    "zsh=${ZSH_VERSION}" \
    "zsh-completions=${ZSH_COMPLETIONS_VERSION}" \
  && chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
