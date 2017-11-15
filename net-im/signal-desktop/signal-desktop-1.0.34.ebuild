# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit eutils

DESCRIPTION="Signal Desktop"
HOMEPAGE="https://github.com/WhisperSystems/Signal-Desktop#readme"
SRC_URI="https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop/signal-desktop_${PV}_amd64.deb"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

# Depends: gconf2, gconf-service, libnotify4, libappindicator1, libxtst6, libnss3, libxss1
RDEPEND="
	x11-libs/libnotify
    gnome-base/gconf:2
    dev-libs/libappindicator
    x11-libs/libXtst
"

src_unpack() {
	# Extract .deb
	mkdir "${S}"
	ar p "../distdir/${A}" data.tar.xz | tar -C "${S}" -Jx || die "Unpack failed"
}

src_install() {
    cp -R "${S}/"* "${D}/" || die "Install failed!"
	dosym /opt/Signal/signal-desktop /usr/bin/signal-desktop
}

