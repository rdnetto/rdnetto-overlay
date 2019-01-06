# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="A simpler way to invoke maven and manage the version of maven within your team."
HOMEPAGE="http://mvnvm.org/"
EGIT_REPO_URI="https://bitbucket.org/mjensen/mvnvm.git"
EGIT_COMMIT="6ea732de52754dd3a2e233ca7c79658948ee340a"
KEYWORDS="~amd64 ~x86"

LICENSE="Apache-2.0"
SLOT="0"

RDEPEND="dev-lang/ruby"

src_install() {
	dobin mvn
	dobin mvnDebug
}
