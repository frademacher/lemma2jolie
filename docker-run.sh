#!/usr/bin/env bash

if [ -z "$1" ]
then
    echo "No input LEMMA domain model given. Exiting..."
    exit 1
fi

file="$1"
folder="$(realpath $(dirname $file))"

docker run -u `id -u`:`id -g` -v "$folder":"$folder" -w "$folder" \
    lemma2jolie:latest \
        -s "$file" \
        -t . \
        code_generation --allow_code_generation_outside_target_folder
