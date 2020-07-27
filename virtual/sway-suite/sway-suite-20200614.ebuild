# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Sway and associated tools"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	gui-wm/sway
	gui-apps/grim
	gui-apps/kanshi
	gui-apps/mako
	gui-apps/slurp
	gui-apps/wdisplays
	gui-apps/wf-recorder
	gui-apps/wl-clipboard
	gui-apps/waybar
	gui-apps/wlogout
	gui-apps/wofi
	media-fonts/fontawesome
	media-video/v4l2loopback
	sys-power/brightnessctl
	www-plugins/brotab
	x11-terms/kitty
	x11-misc/ulauncher
"
