# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/ArtsyMacaw/${PN}"
case "${PV}" in
	"9999")
		inherit git-r3
		;;
	*)
		SRC_URI="${EGIT_REPO_URI}/archive/${PV}.tar.gz -> ${P}.tar.gz"
esac
inherit meson

DESCRIPTION="A wayland based logout menu"
HOMEPAGE="https://github.com/ArtsyMacaw/wlogout"
KEYWORDS="~amd64"
LICENSE="MIT"
SLOT="0"

IUSE="bash-completion fish-completion zsh-completion +doc +transparency"
BDEPEND="
	x11-libs/gtk+:3
	dev-libs/gobject-introspection
	doc? ( app-text/scdoc )
	transparency? ( gui-libs/gtk-layer-shell )
"
DEPEND="${BDEPEND}"


src_configure() {
	local emesonargs=(
		$(meson_use bash-completion bash-completions)
		$(meson_use fish-completion fish-completions)
		$(meson_use zsh-completion zsh-completions)
		$(meson_feature doc man-pages)
	)

	meson_src_configure
}

