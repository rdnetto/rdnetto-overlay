#!/bin/bash
set -euo pipefail

LATEST="$(curl -sS 'https://hg.sr.ht/~scoopta/wofi/tags' | grep -oP 'href="/~scoopta/wofi/archive/v\K.*(?=.tar.gz")' | sort --version-sort | tail -n1)"

if ! [ -f "wofi-${LATEST}.ebuild" ]; then
    echo "Manual bump to gui-apps/wofi-$LATEST required."
    echo "This is needed because we hardcode the git hashes, because the git mirror doesn't include tags and the mercurial repo doesn't work with network-sandbox"
    exit 1
fi

