# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit git-r3 stack

DESCRIPTION="Tool for generating shell prompts. Haskell clone of app-misc/powerline."
HOMEPAGE="https://github.com/rdnetto/powerline-hs.git"
EGIT_REPO_URI="https://github.com/rdnetto/powerline-hs.git"
SRC_URI="$(stack_ghc_src 8.0.2 24)"
RESTRICT="network-sandbox"

if [ "${PV#9999}" == "${PV}" ] ; then
	EGIT_COMMIT="v${PV}"
	KEYWORDS="amd64"
fi

LICENSE="Apache-2.0"
SLOT="0/${PV}"
IUSE=""

