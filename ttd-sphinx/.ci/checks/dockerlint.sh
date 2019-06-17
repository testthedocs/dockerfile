#!/bin/bash
docker run --rm -i hadolint/hadolint hadolint --ignore DL3018 --ignore DL3013 - < dockerfiles/Dockerfile
