# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Collection of shell tools"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	app-editors/neovim
	app-editors/neovim-qt
	app-misc/diff-so-fancy
	app-misc/powerline-hs
	app-misc/tmux
	app-shells/antibody
	app-shells/fasd
	app-shells/fzf
	app-shells/gentoo-zsh-completions
	app-shells/zsh
	app-text/dos2unix
	app-text/sloccount
	dev-python/neovim-remote
	dev-python/pynvim
	dev-util/ctags
	dev-vcs/dispatch-merge
	dev-vcs/git
	dev-vcs/tig
	media-gfx/exif
	sys-apps/bat
	sys-apps/ripgrep
"
