#!/usr/bin/env bash

[[ -z "$*" ]] && echo "Need moar input"  && exit 1
contexts=$(kubectl config get-contexts -o name)
fzf_query=$(echo $@)
context=$(printf "$contexts" | fzf --no-multi -q "${fzf_query}" )

[[ -n "${context}" ]] && kubectl config use-context "${context}"
