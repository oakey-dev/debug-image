#!/usr/bin/env bash
set -euo pipefail

# detect k3s if HOST_PATH is not set and /host/opt/bin exists
if [[ -z "${HOST_PATH:-}" ]] && [[ -d /host/opt/bin ]]; then
    HOST_PATH="/opt/bin:$PATH"
fi
HOST_PATH="${HOST_PATH:-$PATH}"
export HOST_PATH

shopt -s nullglob

default_files=(
    {arp,ip,ip6,eb}tables{,-save}
    {boot,cri,hostname,journal,kube,network,numa,resolve,sys,system,timedate,update,wd}ctl
    {dep,ls,rm}mod
    mod{probe,info}
    efibootmgr
    k3s
    nft
    zincati-update-now
)

if [[ -n "${HOST_COMMANDS-}" ]]; then
    # HOST_COMMANDS is whitespace-separated.
    read -r -a files <<< "$HOST_COMMANDS"
else
    files=("${default_files[@]}")
fi

# HOST_COMMANDS_ADD appends to either the default or replacement list.
if [[ -n "${HOST_COMMANDS_ADD-}" ]]; then
    read -r -a additional_files <<< "$HOST_COMMANDS_ADD"
    files+=("${additional_files[@]}")
fi

COMPLETION_COMMANDS=("crictl" "kubectl" "k3s")
if [[ -n "${COMPLETION_COMMANDS_ADD-}" ]]; then
    read -r -a additional_completion_commands <<< "$COMPLETION_COMMANDS_ADD"
    COMPLETION_COMMANDS+=("${additional_completion_commands[@]}")
fi

old_ifs=$IFS
IFS=:
for file in "${files[@]}"; do
    if [[ "$file" =~ ^/ ]]; then
        cmd=$(basename "${file}")
        if [[ -f "/usr/local/bin/${cmd}" ]]; then
            echo "Error: /usr/local/bin/${cmd} already exists, skipping" >&2
            continue
        fi
        echo -e "#!/bin/sh\nexec hostcmd \"$file\" \"\$@\"" > "/usr/local/bin/${cmd}"
        chmod +x "/usr/local/bin/${cmd}"
        continue
    fi
    for path in $HOST_PATH; do
        [[ -d "$path" ]] || continue
        [[ ! -L "$path" ]] || continue

        if [[ -x "/host${path}/${file}" ]]; then
            ln -sfn hostcmd "/usr/local/bin/${file}"
            # completions
            zcomp="/usr/share/zsh/site-functions/_${file}"
            if [[ ! -f "$zcomp" ]]; then
                if [[ -f "/host$zcomp" ]]; then
                    ln -sfn "/host$zcomp" "$zcomp"
                elif [[ " ${COMPLETION_COMMANDS[*]} " =~  [[:space:]]"${file}"[[:space:]] ]]; then
                    comp=$("$file" completion zsh 2>/dev/null || true)
                    [[ -n "$comp" ]] && echo "$comp" > "$zcomp"
                fi
            fi
            bcomp="/usr/share/bash-completion/completions/${file}"
            if [[ ! -f "$bcomp" ]]; then
                if [[ -f "/host$bcomp" ]]; then
                    ln -sfn "/host$bcomp" "$bcomp"
                elif [[ " ${COMPLETION_COMMANDS[*]} " =~  [[:space:]]"${file}"[[:space:]] ]]; then
                    comp=$("$file" completion bash 2>/dev/null || true)
                    [[ -n "$comp" ]] && echo "$comp" > "$bcomp"
                fi
            fi
            break
        fi
    done
done
IFS=$old_ifs

touch /tmp/debug-ready
exec "$@"
