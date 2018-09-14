#!/bin/sh
set -eu -o pipefail
cd "$(dirname "$0")"

CATEGORY="dev-util"
PN="shellcheck"
REF_EBUILD="$PN-0.4.6.ebuild"

# using tags instead of releases
LATEST="$(curl https://api.github.com/repos/koalaman/$PN/tags       \
    | jq -r '.[] | .name'                                           \
    | sort -V                                                       \
    | tail -n1                                                      \
    | sed s/v//)"

if [ -e "$PN-$LATEST.ebuild" ]; then
	exit 0
fi

echo "$CATEGORY/$PN: Bumping to $LATEST..."
cp "$REF_EBUILD" "$PN-$LATEST.ebuild"

# Need to update the GHC version in the ebuild
echo "Checking LTS resolver..."
RESOLVER="$(curl "https://raw.githubusercontent.com/koalaman/shellcheck/v$LATEST/stack.yaml" \
    | awk -F": " '($1 == "resolver") {print $2}')"

# Querying the build plan is somewhat expensive (it's 5 MB), but not as expensive as downloading GHC
echo "Resolving GHC version for $RESOLVER..."
GHC_VER="$(curl "https://raw.githubusercontent.com/commercialhaskell/lts-haskell/master/$RESOLVER.yaml"    \
    | yq -r '."system-info"."core-packages".ghc' -)"

sed -i "s/SRC_URI=.*/SRC_URI=\"\$(stack_ghc_src $GHC_VER)\"/" "$PN-$LATEST.ebuild"


ebuild "$PN-$LATEST.ebuild" manifest
git add .
git commit -m "$CATEGORY/$PN: Bumping to $LATEST"
git push

