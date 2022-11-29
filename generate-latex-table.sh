#!/bin/bash

./scripts/gen.yml | sort | cut -d ' ' -f 2- | sed 's/ /,/g' | tr '\n' ',' | sed 's/,$//' | sed 's/^/[/' | sed 's/$/]/' | ./scripts/tex.yml

