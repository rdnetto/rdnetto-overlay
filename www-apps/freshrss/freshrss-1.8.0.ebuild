# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit user eutils webapp vcs-snapshot git-r3

DESCRIPTION="FreshRSS - a free, self-hostable aggregator"
HOMEPAGE="https://freshrss.org/"
EGIT_REPO_URI="https://github.com/FreshRSS/FreshRSS.git"

if [ "${PV#9999}" == "${PV}" ] ; then
	EGIT_COMMIT="${PV}"
fi

LICENSE="AGPL-3"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-lang/php:*[postgres,curl,xml,pdo,gmp,json,iconv,zip]
	virtual/httpd-php:*
	dev-db/sqlite
"
RDEPEND="${DEPEND}"

need_httpd_cgi  # From webapp.eclass

src_install() {
	webapp_src_preinst

	insinto "/${MY_HTDOCSDIR}"
	doins -r *

	webapp_serverowned -R "${MY_HTDOCSDIR}/data"
	webapp_src_install
}
