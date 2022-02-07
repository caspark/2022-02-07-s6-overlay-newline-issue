#!/usr/bin/env bash

export MULTILINE="Line 1
Line 2
"

echo "*** Running with S6_KEEP_ENV=0 (multiline env var should appear properly):"
docker run --rm -e MULTILINE -e S6_KEEP_ENV=0 $(docker build -q .)

echo "*** Running with S6_KEEP_ENV=1 (multiline env var gets cut apart):"
docker run --rm -e MULTILINE -e S6_KEEP_ENV=1 $(docker build -q .)
