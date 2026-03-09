#!/usr/bin/env bash
if [[ -z "$1" ]]; then
  echo "Usage: validate_bids.sh /path/to/dataset"
  exit 1
fi

if command -v docker >/dev/null 2>&1; then
  docker run --rm -v "$1:/data:ro" bids/validator /data
else
  npx --yes bids-validator@latest "$1"
fi
