# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="A command-line fuzzy finder written in Go (binary package)"
HOMEPAGE="https://github.com/junegunn/fzf"
SRC_URI="
	https://github.com/junegunn/fzf-bin/releases/download/${PV}/fzf-${PV}-linux_amd64.tgz -> ${P}-bin.tar.gz
	https://github.com/junegunn/fzf/archive/${PV}.tar.gz -> ${P}.tar.gz
	"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="bash zsh tmux"

RDEPEND="
	bash? ( app-shells/bash )
	zsh? ( app-shells/zsh )
	tmux? ( app-misc/tmux )
"

S="${WORKDIR}/fzf-${PV}"

src_unpack() {
	unpack ${P}.tar.gz
	unpack ${P}-bin.tar.gz
	mv fzf-0.15.7-linux_amd64 "fzf-${PV}/fzf"
}

src_install() {
	# Common files
	dobin fzf
	doman man/man1/fzf.1

	# Rename files since doins only takes directories
	mkdir -p bash zsh
	cp shell/completion.bash bash/fzf
	cp shell/completion.zsh zsh/_fzf

	use tmux && dobin bin/fzf-tmux
	use tmux && doman man/man1/fzf-tmux.1
	use bash && insinto /usr/share/bash-completion/completions && doins bash/fzf
	use zsh  && insinto /usr/share/zsh/site-functions  && doins zsh/_fzf
}
