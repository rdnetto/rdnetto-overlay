# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit eutils

DESCRIPTION="A Hipchat client"
HOMEPAGE="http://www.hipchat.com/"

# curl https://atlassian.artifactoryonline.com/atlassian/hipchat-apt-client/dists/xenial/main/binary-amd64/Packages to see the current versions
SRC_URI="https://atlassian.artifactoryonline.com/atlassian/hipchat-apt-client/pool/HipChat4-${PV}-Linux.deb"

LICENSE="Proprietary"
SLOT="0"
KEYWORDS="~amd64"

# Taken from Debian package
RDEPEND="
	>=media-libs/alsa-lib-1.0.16
	>=sys-apps/dbus-1.1.4
	>=dev-libs/expat-2.0.1
	>=media-libs/fontconfig-2.9.0
	>=media-libs/freetype-2.3.9
	media-libs/mesa
	>=dev-libs/glib-2.35.9
	>=x11-libs/libICE-1.0.0
	>=dev-libs/nspr-4.9.2
	>=dev-libs/nss-3.14.4
	x11-libs/libSM
	>=x11-libs/libX11-1.4.99
	x11-libs/libXau
	x11-libs/libxcb
	>=x11-libs/libXcomposite-0.3.1
	>=x11-libs/libXcursor-1.1.2
	>=x11-libs/libXdamage-1.1.1
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXfixes
	>=x11-libs/libxkbcommon-0.2.0
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXtst
"

# Skipped dependencies from Debian package: libc6, libgcc, libstdc++6, libxi6, libxss

# S=${WORKDIR}

src_unpack() {
	# TODO: replace .deb with tarball - can just delete this function then and use the default implementation
	mkdir "${S}"
	ar p "../distdir/${A}" data.tar.gz | tar -C "${S}" -zx || die "Unpack failed"
}

src_install() {
    cp -R "${S}/"* "${D}/" || die "Install failed!"
	dosym /opt/HipChat4/bin/HipChat4 /usr/local/bin/HipChat4
}

