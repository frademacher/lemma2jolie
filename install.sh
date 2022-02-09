#!/usr/bin/env bash

do_install_libs() {
    local groupId=$1
    local artifactId=$1
    local version=$2
    local classifier=$3

    if [ -z "$classifier" ]
    then
        local filepath=libs/$artifactId-$version.jar
    else
        local filepath=libs/$artifactId-$version-$classifier.jar
    fi

    mvn install:install-file \
        -Dfile=$filepath \
        -DgroupId=$groupId \
        -DartifactId=$artifactId \
        -Dversion=$version \
        -Dclassifier=$classifier \
        -Dpackaging=jar \
        -DgeneratePom=true
}

do_install_libs "de.fhdo.lemma.data.datadsl" "0.8.5-SNAPSHOT" \
    "all-dependencies"
do_install_libs "de.fhdo.lemma.model_processing" "0.8.5-SNAPSHOT" \
    "all-dependencies"

mvn clean install
