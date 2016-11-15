# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="The Haskell Tool Stack (patched binary package)"
HOMEPAGE="http://haskellstack.org"
SRC_URI="https://syd.rdnetto.net/pub/stack-1.2.0-r1.tar.xz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}"

src_install() {
	dobin stack
}
