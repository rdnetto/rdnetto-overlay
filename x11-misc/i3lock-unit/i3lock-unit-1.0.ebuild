# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils systemd

DESCRIPTION="Systemd unit for autolocking"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
DEPEND=""
RDEPEND=""

src_unpack() {
	mkdir -p "${S}"
}

src_install() {
	cp "${FILESDIR}/unit.service" "./i3lock@.service"
	systemd_dounit "./i3lock@.service"
}

pkg_postinst() {
	einfo "Enable with systemctl enable i3lock@\$USER"
}
