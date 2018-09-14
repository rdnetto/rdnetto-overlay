# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit git-r3 stack

DESCRIPTION="Shell script analysis tool"
HOMEPAGE="http://www.shellcheck.net/"
EGIT_REPO_URI="https://github.com/koalaman/shellcheck.git"
SRC_URI="$(stack_ghc_src 8.0.2)"

if [ "${PV#9999}" == "${PV}" ] ; then
	EGIT_COMMIT="v${PV}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0/${PV}"
IUSE=""
