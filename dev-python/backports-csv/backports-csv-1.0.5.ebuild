# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )
inherit distutils-r1

DESCRIPTION="Backport of Python 3's csv module for Python 2"

HOMEPAGE="https://github.com/ryanhiebert/backports.csv"
SRC_URI="https://github.com/ryanhiebert/backports.csv/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="PYTHON"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""

# package name is backports.csv, but portage doesn't like the dot
S="${WORKDIR}/${P/-csv/.csv}"
