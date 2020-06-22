# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit meson git-r3

DESCRIPTION="Launcher/menu program for wlroots based wayland compositors such as sway"
HOMEPAGE="https://cloudninja.pw/docs/wofi.html https://hg.sr.ht/~scoopta/wofi"
EGIT_REPO_URI="https://github.com/petabyteboy/wofi-git-mirror.git"
EGIT_COMMIT="40dbc3e73b1cb57707c0e0834a08421b4bff606e"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	dev-libs/wayland
	x11-libs/gtk+[wayland]
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"
S="${WORKDIR}/${PN}-${PV}"
