#!/bin/sh
set -eu -o pipefail
cd "$(dirname "$0")"

CATEGORY="www-plugins"
PN="brotab"
REF_EBUILD="$PN-1.3.0.ebuild"

# using tags instead of releases
LATEST="$(curl -sSfL https://api.github.com/repos/balta2ar/brotab/tags    \
    | jq -r '.[] | .name'                                           \
    | sort -V                                                       \
    | tail -n1                                                      \
    | sed s/v//)"

if [ -e "$PN-$LATEST.ebuild" ]; then
	exit 0
fi

echo "$CATEGORY/$PN: Bumping to $LATEST..."
cp -s "$REF_EBUILD" "$PN-$LATEST.ebuild"

ebuild "$PN-$LATEST.ebuild" manifest
git add .
git commit -m "$CATEGORY/$PN: Bumping to $LATEST"
git push

