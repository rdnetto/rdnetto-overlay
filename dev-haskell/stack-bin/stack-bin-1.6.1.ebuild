# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="The Haskell Tool Stack (binary package)"
HOMEPAGE="http://haskellstack.org"
SRC_URI="https://github.com/commercialhaskell/stack/releases/download/v${PV}/stack-${PV}-linux-x86_64.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
RDEPEND="!dev-haskell/stack"

S="${WORKDIR}/stack-${PV}-linux-x86_64"

src_install() {
	dobin stack
}
