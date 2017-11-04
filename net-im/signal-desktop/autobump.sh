#!/bin/bash
set -e
cd $(dirname $0)

APT_REPO="https://updates.signal.org/desktop/apt"
APT_PKG_NAME="signal-desktop"
LATEST=$(curl -sS "${APT_REPO}/dists/xenial/main/binary-amd64/Packages" \
    | grep -A10 "${APT_PKG_NAME}"\
    | awk '/Version/{print $2}'  \
    | sort --version-sort        \
    | tail -n1                   \
    | sed 's/-.*//')
REF_EBUILD="signal-desktop-1.0.34.ebuild"
NEW_EBUILD="signal-desktop-${LATEST}.ebuild"

if [ ! -f "${NEW_EBUILD}" ]; then
	echo "Bumping version to ${LATEST}..."

	git pull
	cp "$REF_EBUILD" "$NEW_EBUILD"

	repoman manifest .
	git add .
	git commit -m "net-im/signal-desktop: Added version $LATEST"
	git push
fi

