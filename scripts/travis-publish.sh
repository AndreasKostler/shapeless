#!/bin/bash

# Example setting to use at command line for testing:
# export TRAVIS_SCALA_VERSION=2.10.5;export TRAVIS_PULL_REQUEST="false";export TRAVIS_BRANCH="master"

if [[ "${TRAVIS_PULL_REQUEST}" == "false" &&
      "${TRAVIS_BRANCH}" == "master" &&
      $(cat version.sbt) =~ "-SNAPSHOT"
]]; then
  sbt ++${TRAVIS_SCALA_VERSION} validateJVM validateJS publish ;
else
  sbt ++${TRAVIS_SCALA_VERSION} validateJVM validateJS ;
fi
