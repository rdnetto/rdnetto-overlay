# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit rpm

DESCRIPTION="Online video conferencing client"
HOMEPAGE="https://zoom.us/download"
SRC_URI="https://zoom.us/client/latest/zoom_x86_64.tar.xz"

LICENSE="Proprietary"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="pulseaudio gstreamer"

S="${WORKDIR}"

RDEPEND="${DEPEND}
	pulseaudio? ( media-sound/pulseaudio )
	gstreamer? ( media-libs/gst-plugins-base )
	dev-db/sqlite
	dev-db/unixODBC
	dev-libs/glib
	dev-libs/nss
	dev-libs/libxslt
	dev-qt/qtmultimedia
	media-libs/fontconfig
	media-libs/gstreamer
	media-libs/gst-plugins-base
	media-libs/mesa
	x11-libs/libxcb
	x11-libs/libXcomposite
	x11-libs/libXi
	x11-libs/libXrender
	dev-qt/qtwebengine
	dev-qt/qtsvg"

src_install() {
	mkdir -p "${D}/opt"
	cp -Rp "${S}/"* "${D}/opt/"

	dosym ../../opt/zoom/ZoomLauncher /usr/bin/ZoomLauncher
}

