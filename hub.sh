#!/usr/bin/env bash
./test.sh

image='lobnek/docker'

if [ $? -eq 0 ]
then
    # https://stackoverflow.com/questions/27643017/do-i-need-to-manually-tag-latest-when-pushing-to-docker-public-repository
    docker build --tag ${image}:latest --target builder .
    docker push ${image}:latest

    VERSION='v0.8'
    echo ${VERSION}

    docker tag ${image} ${image}:${VERSION}
    docker push ${image}:${VERSION}
    docker rmi -f ${image}:${VERSION}
fi