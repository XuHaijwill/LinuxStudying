#!/bin/bash
#https://www.haxi.cc/archives/shell%E8%A7%A3%E6%9E%90json.html

function get_json_value()
{
  local json=$1
  local key=$2

  if [[ -z "$3" ]]; then
    local num=1
  else
    local num=$3
  fi

  local value=$(echo "${json}" | awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'${key}'\042/){print $(i+1)}}}' | tr -d '"' | sed -n ${num}p)

  echo "${value}"
}

jsonStr=$(cat map.json)
echo $(get_json_value $jsonStr ip)
