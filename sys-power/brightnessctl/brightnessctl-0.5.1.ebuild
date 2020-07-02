# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION=" A program to read and control device brightness "
HOMEPAGE="https://github.com/Hummer12007/brightnessctl"

EGIT_REPO_URI="https://github.com/Hummer12007/${PN}"
SRC_URI="${EGIT_REPO_URI}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="systemd"

src_compile() {
	use systemd && export ENABLE_SYSTEMD=1
	emake --trace
}
