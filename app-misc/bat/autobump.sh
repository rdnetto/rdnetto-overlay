#!/bin/sh
set -eu -o pipefail
cd "$(dirname "$0")"

REF_EBUILD="bat-0.3.0.ebuild"
LATEST="$(curl https://api.github.com/repos/sharkdp/bat/releases/latest | jq -r .tag_name | sed s/v//)"

if [ -e "bat-$LATEST.ebuild" ]; then
	exit 0
fi

echo "app-misc/bat: Bumping to $LATEST..."
cp -s "$REF_EBUILD" "bat-$LATEST.ebuild"
ebuild "bat-$LATEST.ebuild" manifest
git add .
git commit -m "app-misc/bat: Bumping to $LATEST"
git push

