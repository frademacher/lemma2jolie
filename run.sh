#!/usr/bin/env bash

# Note 1: Run install.sh first.
# Note 2: Requires Java 11 to run.

if [ -z "$1" ]
then
    echo "No input LEMMA domain model given. Exiting..."
    exit 1
fi

file="$1"
folder="$(realpath $(dirname $file))"

java -jar target/lemma2jolie.jar \
    -s "$file" \
    -t . \
    code_generation --allow_code_generation_outside_target_folder
