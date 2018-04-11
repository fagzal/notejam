#!/bin/bash
mkdir build
docker save notejam:latest > build/notejam.tar
zip -r build/bundle.zip build/notejam.tar appspec.yml dockerup.sh 
