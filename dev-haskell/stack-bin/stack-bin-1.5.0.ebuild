# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="The Haskell Tool Stack (binary package)"
HOMEPAGE="http://haskellstack.org"
SRC_URI="https://github.com/commercialhaskell/stack/releases/download/v${PV}/stack-${PV}-linux-x86_64.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
# Marking ncurses:5 as incompatible to ensure the correct Stack GHC version is used.
RDEPEND="!dev-haskell/stack
	!sys-libs/ncurses:5"

S="${WORKDIR}/stack-${PV}-linux-x86_64"

src_install() {
	dobin stack
}
