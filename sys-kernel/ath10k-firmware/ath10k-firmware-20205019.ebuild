# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Firmware for Ath10k / QCA6174 wireless chip in Surface Go."
HOMEPAGE="https://github.com/dmhacker/arch-linux-surface/issues/62"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"

SRC_URI="https://github.com/jakeday/linux-surface/raw/a39cc29295318894d624977a107c0999cc0ef6ac/firmware/ath10k_firmware.zip"
S="${WORKDIR}"


src_install() {
	insinto /lib/firmware/ath10k
	doins -r QCA6174
}
