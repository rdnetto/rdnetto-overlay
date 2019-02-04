#!/bin/sh
set -eu -o pipefail
cd "$(dirname "$0")"

CATEGORY="app-editors"
PN="neovim-qt"
REF_EBUILD="$PN-0.2.4.ebuild"
LATEST="$(curl -sSfL https://api.github.com/repos/equalsraf/$PN/releases/latest | jq -r .tag_name | sed s/v//)"


if [ -e "$PN-$LATEST.ebuild" ]; then
	exit 0
fi

echo "$CATEGORY/$PN: Bumping to $LATEST..."
cp -s "$REF_EBUILD" "$PN-$LATEST.ebuild"
ebuild "$PN-$LATEST.ebuild" manifest
git add .
git commit -m "$CATEGORY/$PN: Bumping to $LATEST"
git push

