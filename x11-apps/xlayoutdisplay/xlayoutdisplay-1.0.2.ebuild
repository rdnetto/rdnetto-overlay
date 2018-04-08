# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit cmake-utils

DESCRIPTION="Detects and arranges linux displays"
HOMEPAGE="https://github.com/alex-courtis/xlayoutdisplays"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/alex-courtis/xlayoutdisplay"
else
	SRC_URI="https://github.com/alex-courtis/xlayoutdisplay/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="Apache-2.0"
SLOT="0"

DEPEND="x11-libs/libXrandr
		dev-libs/boost
"
CMAKE_BUILD_TYPE=RelWithDebInfo


src_install() {
	exeinto /usr/bin/
	doexe "${WORKDIR}/${P}_build/xlayoutdisplay"
}
