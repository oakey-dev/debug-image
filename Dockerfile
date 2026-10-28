FROM alpine:3.24.3@sha256:be2656061b536c1883c4034790e21d0a09c5aaaf51968b89368a3c0371ea2c9a

# Add this label to your Dockerfile
LABEL org.opencontainers.image.source=https://github.com/oakey-dev/debug-image

# Copy entrypoint script into the image
COPY --chmod=755 bin/* /usr/local/bin/
COPY zsh-zshrc.d-fixes.zsh /etc/zsh/zshrc.d/fixes.zsh

# allow specifying host commands (overwrites default) and/or additional host commands
# check bin/entrypoint.sh for defaults
ENV HOST_COMMANDS="" \
    HOST_COMMANDS_ADD="" \
    COMPLETION_COMMANDS_ADD=""
# default: PATH (alpine default) + detect k3s /host/opt/bin
ENV HOST_PATH=""

RUN apk update && apk add --no-cache \
    "atop-doc=2.12.1-r0" \
    "atop=2.12.1-r0" \
    "bash-completion-doc=2.17.0-r1" \
    "bash-completion=2.17.0-r1" \
    "bash-doc=5.3.9-r1" \
    "bash=5.3.9-r1" \
    "bind-doc=9.20.30-r0" \
    "bind-tools=9.20.30-r0" \
    "btop-doc=1.4.6-r0" \
    "btop=1.4.6-r0" \
    "ca-certificates-doc=20261020-r0" \
    "ca-certificates=20261020-r0" \
    "curl-doc=8.23.0-r0" \
    "curl=8.23.0-r0" \
    "ethtool-doc=7.0-r0" \
    "ethtool=7.0-r0" \
    "grml-zsh-config-doc=0.19.10-r0" \
    "grml-zsh-config=0.19.10-r0" \
    "htop-doc=3.5.3-r0" \
    "htop=3.5.3-r0" \
    "iftop-doc=1.0_pre4-r0" \
    "iftop=1.0_pre4-r0" \
    "inxi-doc=3.3.39.1-r0" \
    "inxi=3.3.39.1-r0" \
    "iotop-doc=0.6-r14" \
    "iotop=0.6-r14" \
    "iperf3-doc=3.20-r0" \
    "iperf3=3.20-r0" \
    "iproute2-doc=7.0.0-r0" \
    "iproute2=7.0.0-r0" \
    "iputils-doc=20250605-r2" \
    "iputils=20250605-r2" \
    "jq-doc=1.8.2-r0" \
    "jq=1.8.2-r0" \
    "less-doc=702-r0" \
    "less=702-r0" \
    "man-db-doc=2.13.1-r1" \
    "man-db=2.13.1-r1" \
    "man-pages=6.18-r0" \
    "mtr-doc=0.96-r2" \
    "mtr=0.96-r2" \
    "vim-common=9.2.1202-r0" \
    "vim-doc=9.2.1202-r0" \
    "vim=9.2.1202-r0" \
    "nmap-doc=7.99-r0" \
    "nmap=7.99-r0" \
    "pstree-doc=2.40-r2" \
    "pstree=2.40-r2" \
    "py3-argcomplete=3.6.3-r1" \
    "python3-doc=3.14.10-r1" \
    "python3=3.14.10-r1" \
    "rsync-doc=3.5.0-r0" \
    "rsync=3.5.0-r0" \
    "tcpdump-doc=4.99.6-r1" \
    "tcpdump=4.99.6-r1" \
    "tmux-doc=3.7c-r0" \
    "tmux=3.7c-r0" \
    "tree-doc=2.3.2-r0" \
    "tree=2.3.2-r0" \
    "vnstat-doc=2.13-r1" \
    "vnstat=2.13-r1" \
    "wget-doc=1.25.0-r3" \
    "wget=1.25.0-r3" \
    "yq-go=4.53.3-r2" \
    "zsh-completions=0.35.0-r0" \
    "zsh-doc=5.9-r7" \
    "zsh=5.9-r7"

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["sleep", "inf"]
