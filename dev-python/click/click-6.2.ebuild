# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="A simple wrapper around optparse for powerful command line utilities."
HOMEPAGE="https://github.com/mitsuhiko/click"
SRC_URI="mirror://pypi/c/click/${P}.tar.gz"

LICENSE="BSD-2"
KEYWORDS="~amd64"
SLOT="0"
IUSE="doc examples"

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"

DOCS=docs

EXAMPLES=examples
