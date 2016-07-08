# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

CABAL_FEATURES="bin profile haddock hoogle hscolour"
inherit git-r3 haskell-cabal

DESCRIPTION="CLI tool for resolving merge conflicts, inspired by dispatch-conf."
HOMEPAGE="https://bitbucket.org/rdnetto/dispatch-merge"
EGIT_REPO_URI="https://rdnetto@bitbucket.org/rdnetto/dispatch-merge.git"

if [ "${PV#9999}" == "${PV}" ] ; then
	EGIT_COMMIT="${PV}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="Apache-2.0"
SLOT="0/${PV}"
IUSE=""

RDEPEND=">=dev-lang/ghc-7.8.4"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
	>=dev-haskell/ansi-terminal-0.6.2.3
	>=dev-haskell/terminal-size-0.3.2.1
"
