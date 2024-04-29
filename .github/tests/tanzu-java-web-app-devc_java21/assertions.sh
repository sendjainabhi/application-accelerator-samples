#!/bin/bash
set -euo pipefail

pushd $1
if [ ! -f .devcontainer.json ]; then
   echo "No .devcontainer.json file!"
   exit 1
else 
   if ! grep -q '"version": "21"' .devcontainer.json; then
      echo "Couldn't find Java version 21"
      exit 2
   fi
   if grep -q 'installGradle' .devcontainer.json; then
      echo "devcontainer.json shouldn't have 'installGradle'"
      exit 3
   fi
   if grep -q 'installMaven' .devcontainer.json; then
      echo "devcontainer.json shouldn't have 'installMaven'"
      exit 4
   fi
fi
if [ ! -f pom.xml ]; then
   echo "No pom.xml file!"
   exit 5
fi
if [ ! -f README-devcontainer.md ]; then
   echo "No README-devcontainer.md file!"
   exit 6
fi
popd