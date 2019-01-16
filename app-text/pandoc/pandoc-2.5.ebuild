# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit

DESCRIPTION="Universal markup converter (binary package)"
HOMEPAGE="https://pandoc.org/"
SRC_URI="https://github.com/jgm/pandoc/releases/download/${PV}/${PN}-${PV}-linux.tar.gz"

LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="~amd64"

src_compile() {
	gzip -d share/man/man1/pandoc.1.gz
	gzip -d share/man/man1/pandoc-citeproc.1.gz
}

src_install() {
	dobin bin/pandoc
	dobin bin/pandoc-citeproc
	doman share/man/man1/pandoc.1
	doman share/man/man1/pandoc-citeproc.1
}
