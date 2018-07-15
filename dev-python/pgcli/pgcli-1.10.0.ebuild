# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="CLI for Postgres Database. With auto-completion and syntax highlighting."
HOMEPAGE="http://pgcli.com"
SRC_URI="mirror://pypi/p/pgcli/${P}.tar.gz"

LICENSE="BSD-2"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=">=dev-python/prompt_toolkit-1.0.10
	<dev-python/prompt_toolkit-1.1.0
	>=dev-python/python-sqlparse-0.2.2
	<dev-python/python-sqlparse-0.3.0
	>=dev-python/click-4.1
	>=dev-python/configobj-5.0.6
	>=dev-python/pgspecial-1.11.0
	>=dev-python/psycopg-2.7.4
	>=dev-python/pygments-2.0
	>=dev-python/setproctitle-1.1.9
	dev-python/humanize
	dev-python/setuptools
	>=dev-python/cli_helpers-1.0.1
	>=dev-python/keyring-11.0.0
	"

python_prepare_all() {
	distutils-r1_python_prepare_all
}
