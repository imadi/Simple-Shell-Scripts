#!/bin/bash +x
keys()
{
    INPUT_DICT=("$@")
    KEYS=()
    for DATA in "${INPUT_DICT[@]}" ; do
        KEYS+=("${DATA%%:*}")
    done
    echo "${KEYS[@]}"
}

values()
{
    INPUT_DICT=("$@")
    VALUES=()
    for DATA in "${INPUT_DICT[@]}" ; do
        VALUES+=("${DATA##*:}")
    done
    echo "${VALUES[@]}"
}

pprint_dict()
{
    INPUT_DICT=("$@")
    for DATA in "${INPUT_DICT[@]}" ; do
        echo "${DATA%%:*}:${DATA##*:}"
    done
}


MAP=( "name:Adithya"
      "age:29"
    )

echo "KEYS=$(keys "${MAP[@]}")"
echo "VALUES=$(values "${MAP[@]}")"
pprint_dict "${MAP[@]}"
