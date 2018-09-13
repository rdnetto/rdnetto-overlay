#!/bin/sh
set -eu -o pipefail
cd "$(dirname "$0")"

CATEGORY="dev-haskell"
PN="stack-bin"
REF_EBUILD="$PN-1.6.1.ebuild"
LATEST="$(curl https://api.github.com/repos/commercialhaskell/stack/releases/latest | jq -r .tag_name | sed s/v//)"


if [ -e "$PN-$LATEST.ebuild" ]; then
	exit 0
fi

echo "$CATEGORY/$PN: Bumping to $LATEST..."
cp -s "$REF_EBUILD" "$PN-$LATEST.ebuild"
ebuild "$PN-$LATEST.ebuild" manifest
git add .
git commit -m "$CATEGORY/$PN: Bumping to $LATEST"
git push

