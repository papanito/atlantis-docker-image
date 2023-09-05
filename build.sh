#!/usr/bin/env bash
tag=v0.25.0
docker buildx build . --build-arg=$tag --target base -t papanito/atlantis-azure:$tag --push
docker buildx build . --build-arg=$tag --target pwsh -t papanito/atlantis-azure:$tag-pwsh --push