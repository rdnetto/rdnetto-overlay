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
RDEPEND=">=dev-python/prompt_toolkit-1.0.0
	<dev-python/prompt_toolkit-1.1.0
	=dev-python/python-sqlparse-0.1.19
	>=dev-python/click-4.1
	>=dev-python/configobj-5.0.6
	>=dev-python/pgspecial-1.5.0
	dev-python/psycopg:2
	>=dev-python/pygments-2.0
	>=dev-python/setproctitle-1.1.9
	dev-python/humanize
	dev-python/wcwidth
	dev-python/setuptools"
