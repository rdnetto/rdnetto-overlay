# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit cmake-utils

DESCRIPTION="Qt GUI/RPC for Neovim"
HOMEPAGE="https://github.com/equalsraf/neovim-qt"

MSGPACK_VERSION="3.2.0"
SRC_URI="https://github.com/equalsraf/neovim-qt/archive/v${PV}.tar.gz
	https://github.com/msgpack/msgpack-c/archive/cpp-${MSGPACK_VERSION}.tar.gz -> msgpack-${MSGPACK_VERSION}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qttest:5
	dev-qt/qtwidgets:5"
RDEPEND="${DEPEND}
	app-editors/neovim"

src_prepare() {
	# Download msgpack beforehand to work with network-sandbox
	epatch "${FILESDIR}/${PN}-${PV}.patch"
	pwd
	ls
	cp "${DISTDIR}/msgpack-${MSGPACK_VERSION}.tar.gz" "${WORKDIR}/${PN}-${PV}/third-party/"

	cmake-utils_src_prepare
}
