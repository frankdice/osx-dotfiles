#!/usr/bin/env bash

[[ -z "$*" ]] && echo "Need moar input"  && exit 1
projects=$(gcloud  projects list --format "value(projectId)")
fzf_query=$(echo $@)
project=$(printf "$projects" | fzf --no-multi -q "${fzf_query}" )

[[ -n "${project}" ]] && gcloud config set project "${project}"
