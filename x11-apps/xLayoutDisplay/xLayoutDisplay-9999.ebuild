# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit cmake-utils

DESCRIPTION="Detects and arranges linux displays"
HOMEPAGE="https://github.com/alex-courtis/xLayoutDisplays"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/alex-courtis/xLayoutDisplays"
else
	SRC_URI="https://github.com/alex-courtis/xLayoutDisplays/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="UNKNOWN"
SLOT="0"

DEPEND="x11-libs/libXrandr
		dev-cpp/gtest
		dev-libs/boost
"
CMAKE_BUILD_TYPE=RelWithDebInfo


src_install() {
	exeinto /usr/bin/
	doexe "${WORKDIR}/${P}_build/xLayoutDisplay"
}
