FROM alpine:3.24.1

# Copy entrypoint script into the image
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# renovate: datasource=repology depName=alpine_3_24/atop versioning=apk
ENV ATOP_VERSION="2.0.0"
# renovate: datasource=repology depName=alpine_3_24/bind-tools versioning=apk
ENV BIND_TOOLS_VERSION="9.0.0"
# renovate: datasource=repology depName=alpine_3_24/ca-certificates versioning=apk
ENV CA_CERTIFICATES_VERSION="20260611"
# renovate: datasource=repology depName=alpine_3_24/curl versioning=apk
ENV CURL_VERSION="8.0.0"
# renovate: datasource=repology depName=alpine_3_24/iftop versioning=apk
ENV IFTOP_VERSION="1.0_pre4-r0"
# renovate: datasource=repology depName=alpine_3_24/inxi versioning=apk
ENV INXI_VERSION="3.0.0"
# renovate: datasource=repology depName=alpine_3_24/iperf3 versioning=apk
ENV IPERF3_VERSION="3.0.0"
# renovate: datasource=repology depName=alpine_3_24/iproute2 versioning=apk
ENV IPROUTE2_VERSION="7.0.0"
# renovate: datasource=repology depName=alpine_3_24/iputils versioning=apk
ENV IPUTILS_VERSION="20250605"
# renovate: datasource=repology depName=alpine_3_24/less versioning=apk
ENV LESS_VERSION="702"
# renovate: datasource=repology depName=alpine_3_24/grml-zsh-config versioning=apk
ENV GRML_ZSH_CONFIG_VERSION="0.0.0"
# renovate: datasource=repology depName=alpine_3_24/htop versioning=apk
ENV HTOP_VERSION="3.5.1"
# renovate: datasource=repology depName=alpine_3_24/mtr versioning=apk
ENV MTR_VERSION="0.0.0"
# renovate: datasource=repology depName=alpine_3_24/man-pages versioning=apk
ENV MAN_PAGES_VERSION="6.18"
# renovate: datasource=repology depName=alpine_3_24/neovim versioning=apk
ENV NEOVIM_VERSION="0.0.0"
# renovate: datasource=repology depName=alpine_3_24/nmap versioning=apk
ENV NMAP_VERSION="7.99"
# renovate: datasource=repology depName=alpine_3_24/python3 versioning=apk
ENV PYTHON3_VERSION="3.14.5"
# renovate: datasource=repology depName=alpine_3_24/pstree versioning=apk
ENV PSTREE_VERSION="2.40"
# renovate: datasource=repology depName=alpine_3_24/tcpdump versioning=apk
ENV TCPDUMP_VERSION="4.99.6"
# renovate: datasource=repology depName=alpine_3_24/tmux versioning=apk
ENV TMUX_VERSION="3.6b"
# renovate: datasource=repology depName=alpine_3_24/tree versioning=apk
ENV TREE_VERSION="2.3.2"
# renovate: datasource=repology depName=alpine_3_24/vnstat versioning=apk
ENV VNSTAT_VERSION="2.13"
# renovate: datasource=repology depName=alpine_3_24/wget versioning=apk
ENV WGET_VERSION="1.25.0"
# renovate: datasource=repology depName=alpine_3_24/zsh versioning=apk
ENV ZSH_VERSION="5.9"

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
    "python3=${PYTHON_VERSION}" \
    "tcpdump=${TCPDUMP_VERSION}" \
    "tmux=${TMUX_VERSION}" \
    "tree=${TREE_VERSION}" \
    "vnstat=${VNSTAT_VERSION}" \
    "wget=${WGET_VERSION}" \
    "zsh=${ZSH_VERSION}" \
  && chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
