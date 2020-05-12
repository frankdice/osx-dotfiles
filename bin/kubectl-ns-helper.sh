#!/usr/bin/env bash

HELPER_FILE=~/.config/kubectl-helper

if [[ $1 == 's' && ! -z $2 ]]
then
  # namespaces=$(kubectl get ns --no-headers -o jsonpath="{.items[*].metadata.name}")
  namespaces=$(kubectl get ns --no-headers | awk '{print $1}')
  fzf_query=$(echo $2)
  ns=$(printf "$namespaces" | fzf --no-multi --select-1 -q "${fzf_query}" )
  echo "${ns}" > $HELPER_FILE
  echo "KUBE_NS: ${ns}"
  exit
fi


if [[ -s $HELPER_FILE ]]
then
  kubectl -n $(cat $HELPER_FILE) "$@"
else
  echo "KUBE_NS not set"
fi
