#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

function has() {
  type "$1" &> /dev/null
}

if has https; then
  mkdir --parents --verbose "$(dirname "$2")"
  https --body --output="$2" --download "$1"
elif has wget; then
  mkdir --parents --verbose "$(dirname "$2")"
  wget --output-document="$2" "$1"
else
  exit 127
fi
