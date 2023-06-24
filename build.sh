#!/bin/bash
tag=v0.24.2
docker buildx build . --build-arg=$tag --target base -t papanito/atlantis-azure:$tag --push

docker buildx build . --build-arg=$tag --target pwsh -t papanito/atlantis-azure:$tag-pwsh --push