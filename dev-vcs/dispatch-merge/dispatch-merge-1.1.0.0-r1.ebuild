# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit git-r3 stack

DESCRIPTION="CLI tool for resolving merge conflicts, inspired by dispatch-conf."
HOMEPAGE="https://bitbucket.org/rdnetto/dispatch-merge"
EGIT_REPO_URI="https://rdnetto@bitbucket.org/rdnetto/dispatch-merge.git"
SRC_URI="$(stack_ghc_src 7.10.3)"

if [ "${PV#9999}" == "${PV}" ] ; then
	EGIT_COMMIT="${PV}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="Apache-2.0"
SLOT="0/${PV}"
IUSE=""

