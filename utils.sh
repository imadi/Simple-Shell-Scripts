#!/bin/bash

function formRequest() {
  name=$1
  version=$2
  jq -n -c --arg name "$name" --arg v "$version" '{name:$name,version:$v}'

}

#req=$(formRequest "a" "1.2")

#echo $req

LISTS=("a:1.2" "b:1.4")
requestArray=()
#echo $LISTS
for LIST in "${LISTS[@]}"; do
  # echo ""$LIST
  IFS=: read -r name version <<<"$LIST"
  requestArray+=("$(formRequest "${name}" "${version}")")
done
echo "${requestArray[@]}" | jq -c -s '{data:.}'
