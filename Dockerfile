FROM alpine:3.24.1

# Copy entrypoint script into the image
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# renovate: datasource=repology depName=alpine_3_24/atop versioning=loose
ENV ATOP_VERSION="2.12.0"
# renovate: datasource=repology depName=alpine_3_24/bind-tools versioning=loose
ENV BIND_TOOLS_VERSION="9.20.25"
# renovate: datasource=repology depName=alpine_3_24/ca-certificates versioning=loose
ENV CA_CERTIFICATES_VERSION="20260611-r0"
# renovate: datasource=repology depName=alpine_3_24/curl versioning=loose
ENV CURL_VERSION="8.20.0"
# renovate: datasource=repology depName=alpine_3_24/iftop versioning=loose
ENV IFTOP_VERSION="1.0_pre4-r0"
# renovate: datasource=repology depName=alpine_3_24/inxi versioning=loose
ENV INXI_VERSION="3.3.39.0"
# renovate: datasource=repology depName=alpine_3_24/iotop versioning=loose
ENV IOTOP_VERSION="0.5"
# renovate: datasource=repology depName=alpine_3_24/iperf3 versioning=loose
ENV IPERF3_VERSION="3.19"
# renovate: datasource=repology depName=alpine_3_24/iproute2 versioning=loose
ENV IPROUTE2_VERSION="7.0.0-r0"
# renovate: datasource=repology depName=alpine_3_24/iputils versioning=loose
ENV IPUTILS_VERSION="20250605-r0"
# renovate: datasource=repology depName=alpine_3_24/less versioning=loose
ENV LESS_VERSION="702-r0"
# renovate: datasource=repology depName=alpine_3_24/grml-zsh-config versioning=loose
ENV GRML_ZSH_CONFIG_VERSION="0.19.9"
# renovate: datasource=repology depName=alpine_3_24/htop versioning=loose
ENV HTOP_VERSION="3.5.0"
# renovate: datasource=repology depName=alpine_3_24/mtr versioning=loose
ENV MTR_VERSION="0.95"
# renovate: datasource=repology depName=alpine_3_24/man-pages versioning=loose
ENV MAN_PAGES_VERSION="6.17"
# renovate: datasource=repology depName=alpine_3_24/neovim versioning=loose
ENV NEOVIM_VERSION="0.12.1"
# renovate: datasource=repology depName=alpine_3_24/nmap versioning=loose
ENV NMAP_VERSION="7.98"
# renovate: datasource=repology depName=alpine_3_24/python3 versioning=loose
ENV PYTHON3_VERSION="3.14.4"
# renovate: datasource=repology depName=alpine_3_24/pstree versioning=loose
ENV PSTREE_VERSION="2.39"
# renovate: datasource=repology depName=alpine_3_24/tcpdump versioning=loose
ENV TCPDUMP_VERSION="4.99.5"
# renovate: datasource=repology depName=alpine_3_24/tmux versioning=loose
ENV TMUX_VERSION="3.6a"
# renovate: datasource=repology depName=alpine_3_24/tree versioning=loose
ENV TREE_VERSION="2.3.1"
# renovate: datasource=repology depName=alpine_3_24/vnstat versioning=loose
ENV VNSTAT_VERSION="2.12"
# renovate: datasource=repology depName=alpine_3_24/wget versioning=loose
ENV WGET_VERSION="1.24.0"
# renovate: datasource=repology depName=alpine_3_24/zsh versioning=loose
ENV ZSH_VERSION="5.8"

RUN apk update && apk add --no-cache \
    "atop=${ATOP_VERSION}" \
    "bind-tools=${BIND_TOOLS_VERSION}" \
    "ca-certificates=${CA_CERTIFICATES_VERSION}" \
    "curl=${CURL_VERSION}" \
    "grml-zsh-config=${GRML_ZSH_CONFIG_VERSION}" \
    "htop=${HTOP_VERSION}" \
    "iftop=${IFTOP_VERSION}" \
    "inxi=${INXI_VERSION}" \
    "iotop=${IOTOP_VERSION}" \
    "iperf3=${IPERF3_VERSION}" \
    "iproute2=${IPROUTE2_VERSION}" \
    "iputils=${IPUTILS_VERSION}" \
    "less=${LESS_VERSION}" \
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
    "zsh=${ZSH_VERSION}" \
  && chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
