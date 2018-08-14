# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit cmake-utils git-r3

DESCRIPTION="Qt GUI/RPC for Neovim"
HOMEPAGE="https://github.com/equalsraf/neovim-qt"
EGIT_REPO_URI="https://github.com/equalsraf/neovim-qt.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/msgpack
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qttest:5
	dev-qt/qtwidgets:5"
RDEPEND="${DEPEND}
	app-editors/neovim"

# This is basically a hotfix release to include the GuiTabline command, so that we can disable it as it breaks airline
# Can be removed once we get a release as requested on: https://github.com/equalsraf/neovim-qt/issues/366
EGIT_COMMIT="3035fd911f9ac951b32a3666242a541cd5fd7fd7"

