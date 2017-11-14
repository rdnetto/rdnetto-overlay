# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
EGO_PN="github.com/ibuildthecloud/systemd-docker"

EGIT_REPO_URI="https://github.com/ibuildthecloud/systemd-docker.git"
EGIT_COMMIT="v${PV}"
ARCHIVE_URI="https://github.com/ibuildthecloud/systemd-docker/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
SRC_URI="${ARCHIVE_URI}"
KEYWORDS="~amd64"
inherit golang-vcs-snapshot golang-build

DESCRIPTION="Wrapper for 'docker run' to handle systemd quirks"
HOMEPAGE="https://github.com/ibuildthecloud/systemd-docker"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""
DEPEND=""

src_compile() {
	# using the project build script, as it has a non-standard structure
	# need to do this, because there's a hardcoded call to pwd in the build script
	BUILD_DIR="${WORKDIR}/${PN}-${PV}/src/${EGO_PN%/...}"
	pushd ${BUILD_DIR}
	./build || die "Build failed"
	popd
}

src_install() {
	exeinto "/usr/bin"
	doexe "${BUILD_DIR}"/bin/*
}
