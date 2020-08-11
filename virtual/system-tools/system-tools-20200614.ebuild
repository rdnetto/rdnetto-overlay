# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Collection of system tools"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	app-admin/entr
	app-admin/pwgen
	app-admin/sudo
	app-misc/uptimed
	app-portage/eix
	app-portage/elogv
	app-portage/genlop
	app-portage/gentoolkit
	app-portage/layman
	app-portage/pfl
	app-portage/portage-utils
	app-portage/repoman
	media-sound/alsa-utils
	net-analyzer/mtr
	net-analyzer/nethogs
	net-analyzer/traceroute
	net-fs/nfs-utils
	net-fs/sshfs
	net-libs/liboping
	net-misc/curl
	net-misc/iputils
	net-misc/mosh
	net-misc/openssh
	net-misc/wget
	sys-apps/bar
	sys-apps/fwupd
	sys-apps/gptfdisk
	sys-apps/lshw
	sys-apps/moreutils
	sys-apps/pv
	sys-block/parted
	sys-boot/efibootmgr
	sys-boot/grub:2
	sys-fs/bcache-tools
	sys-fs/btrfs-progs
	sys-fs/xfsprogs
	sys-kernel/gentoo-kernel-bin
	sys-kernel/linux-firmware
	x11-terms/kitty-terminfo
"
