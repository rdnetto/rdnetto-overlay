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
	>=dev-python/pgspecial-1.10.0
	>=dev-python/psycopg-2.7.4
	>=dev-python/pygments-2.0
	>=dev-python/setproctitle-1.1.9
	dev-python/humanize
	dev-python/setuptools
	>=dev-python/cli_helpers-1.0.1
	"

python_prepare_all() {
	# In psycopg 2.7.4, the psycopg2-binary parallel package was introduced to deal with issues around C dependencies.
	# This is irrelevant on Gentoo, since they're handled as regular ebuilds, so we just change the dependency to the one we already have.
	# This problem will go away in psycopg 2.8.x.
	# See: http://initd.org/psycopg/articles/2018/02/08/psycopg-274-released/
	sed -i 's/psycopg2-binary/psycopg2/' setup.py

	distutils-r1_python_prepare_all
}
