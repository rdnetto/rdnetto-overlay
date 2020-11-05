# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit distutils-r1

DESCRIPTION="Control your browser's tabs from the command line"
HOMEPAGE="https://github.com/balta2ar/brotab"
SRC_URI="https://github.com/balta2ar/brotab/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

# From https://github.com/balta2ar/brotab/blob/master/requirements/base.txt
RDEPEND="
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/pip[${PYTHON_USEDEP}]
"

pkg_postinst() {
	elog ""
	elog "To enable browser integrations, please run:"
	elog "  brotab install"
	elog ""
}
