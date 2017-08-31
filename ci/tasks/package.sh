#!/bin/bash

set -e +x

pushd movie-fun
  echo "Packaging war"
  ./mvnw clean package -DskipTests
popd

jar_count=`find movie-fun/target -type f -name *.war | wc -l`

if [ $jar_count -gt 1 ]; then
  echo "More than one jar found, don't know which one to deploy. Exiting"
  exit 1
fi



find movie-fun/target -type f -name *.jar -exec cp "{}" package-output/moviefun.war \;

echo "Done packaging"
exit 0
