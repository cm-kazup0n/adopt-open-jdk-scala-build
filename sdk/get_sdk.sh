#!/bin/sh

JDK_URL=$(curl -s https://api.adoptopenjdk.net/v1/openjdk8/releases | jq -r '.binaries[] | select(.platform == "macOS x64") | .binary_link')
echo "Downloading $JDK_URL"
curl -L -o./sdk/sdk_tmp.tar.gz $JDK_URL
tar xvzf ./sdk/sdk_tmp.tar.gz -C sdk/
rm ./sdk/sdk_tmp.tar.gz

echo '-java-home' >> .sbtopts
echo $(find sdk -name 'jdk*' -type d) >> .sbtopts
