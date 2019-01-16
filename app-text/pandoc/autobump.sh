#!/bin/sh
set -eu -o pipefail
cd "$(dirname "$0")"

CATEGORY="app-text"
PN="pandoc"
REF_EBUILD="$PN-2.5.ebuild"
LATEST="$(curl https://api.github.com/repos/jgm/$PN/releases/latest | jq -r .tag_name | sed s/v//)"


if [ -e "$PN-$LATEST.ebuild" ]; then
	exit 0
fi

echo "$CATEGORY/$PN: Bumping to $LATEST..."
cp -s "$REF_EBUILD" "$PN-$LATEST.ebuild"
ebuild "$PN-$LATEST.ebuild" manifest
git add .
git commit -m "$CATEGORY/$PN: Bumping to $LATEST"
git push

