#!/usr/bin/env bash

[[ -z "$*" ]] && echo "Need moar input"  && exit 1
instances=$(gcloud compute instances list --format "value(name, zone)")
fzf_query=$(echo $@)
#Using a bit of bash magic to convert the string into an array of strings.
#Thank you stackoverflow: https://stackoverflow.com/questions/1469849/how-to-split-one-string-into-multiple-strings-separated-by-at-least-one-space-in
instance=($(printf "$instances" | fzf --no-multi -q "${fzf_query}" ))

[[ -n "${instance}" ]] && \
  echo "gcloud compute ssh --internal-ip ${instance[0]} --zone=${instance[1]}" && \
  gcloud compute ssh --internal-ip ${instance[0]} --zone=${instance[1]}
