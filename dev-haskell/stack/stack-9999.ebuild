# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
# Yes, this ebuild requires another version of stack to be installed already. Stack-bin should make it trivial to bootstrap.
inherit git-r3 stack

DESCRIPTION="The Haskell Tool Stack"
HOMEPAGE="https://github.com/commercialhaskell/stack"
EGIT_REPO_URI="https://github.com/commercialhaskell/stack"
SRC_URI="$(stack_ghc_src 8.0.2)"

if [ "${PV#9999}" == "${PV}" ] ; then
	EGIT_COMMIT="v${PV}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="BSD"
SLOT="0/${PV}"
IUSE=""

