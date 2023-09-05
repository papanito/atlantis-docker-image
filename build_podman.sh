#!/usr/bin/env bash
tag=v0.25.0
docker buildx build . --build-arg=$tag --target base -t docker.io/papanito/atlantis-azure:$tag 
docker buildx build . --build-arg=$tag --target pwsh -t docker.io/papanito/atlantis-azure:$tag-pwsh 