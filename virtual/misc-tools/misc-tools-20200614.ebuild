# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Collection of misc tools"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	kde-misc/kdiff3
	app-admin/keepassxc
	app-emulation/docker
	app-office/libreoffice-bin
	dev-python/virtualenv
	mail-client/thunderbird-bin
	mate-extra/mate-system-monitor
	media-fonts/corefonts
	media-fonts/dejavu
	media-fonts/droid
	media-gfx/brother-scan4-bin
	media-sound/audacity
	media-sound/clementine
	media-sound/pavucontrol
	media-video/mpv
	media-video/vlc
	net-analyzer/wireshark
	net-misc/youtube-dl
	net-p2p/deluge
	net-wireless/wireless-tools
	www-client/google-chrome
	www-client/elinks
	www-client/firefox-bin
	www-plugins/chrome-binary-plugins
	x11-apps/mesa-progs
	x11-apps/xev
	x11-apps/xkill
	x11-misc/arandr
	x11-misc/sddm
	x11-terms/kitty
"
