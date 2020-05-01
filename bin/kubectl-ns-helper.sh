#!/usr/bin/env bash

HELPER_FILE=~/.config/kubectl-helper

if [[ $1 == 's' && ! -z $2 ]]
then
  echo "$2" > $HELPER_FILE
  exit
fi


if [[ -s $HELPER_FILE ]]
then
  kubectl -n $(cat $HELPER_FILE) "$@"
else
  echo "KUBE_NS not set"
fi
