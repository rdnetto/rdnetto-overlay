#!/bin/bash
set -e
cd $(dirname $0)

APT_REPO="https://atlassian.artifactoryonline.com/atlassian/hipchat-apt-client/dists/xenial/main"
LATEST=$(curl -sSfL "${APT_REPO}/binary-amd64/Packages" | grep -A1 hipchat4 | awk '/Version/{print $2}' | sort | tail -n1)

REF_EBUILD="hipchat-bin-4.0.1634.ebuild"
NEW_EBUILD="hipchat-bin-${LATEST}.ebuild"

if [ ! -f "${NEW_EBUILD}" ]; then
	echo "Bumping version to ${LATEST}..."
	git pull
	cp "$REF_EBUILD" "$NEW_EBUILD"
	repoman manifest .
	git add .
	git commit -m "net-im/hipchat-bin: Added version $LATEST"
	git push
fi

