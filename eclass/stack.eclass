# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

# @ECLASS: stack.eclass
# @MAINTAINER: Renee D'Netto <rdnetto@gmail.com>
# @AUTHOR: Renee D'Netto <rdnetto@gmail.com>
# @BLURB: An eclass for programs compiled using Haskell Stack.
# @DESCRIPTION:
# This eclass allows Haskell programs to be compiled using Stack,
# which pins library versions using resolvers.
# This enables programs using different library versions to be installed side-by-side.
# It also provides a choice of dependency on stack or stack-bin, enabling these packages
# to be installed without pulling in the entire Haskell platform.
#
# Inheritors need to specify the version of GHC to use like so:
# 	SRC_URI="$(stack_ghc_src 8.0.2)"

# Include generated code
inherit stack_urls

# Either stack package can be used.
DEPEND="|| ( dev-haskell/stack dev-haskell/stack-bin )"

EXPORT_FUNCTIONS src_configure src_compile src_install

# We want this to be cached across builds, but $HOME is package-specific
STACK_ROOT="/var/tmp/portage/.stack"
STACK_ARGS="--stack-root ${STACK_ROOT}"

# @FUNCTION: stack_src_configure
# @DESCRIPTION:
# Configure the package.
stack_src_configure() {
	# Make sure working directory exists
	mkdir -p ${STACK_ROOT}

	# Add pre-downloaded STACK_GHC to Stack path
	einfo "Configuring GHC"
	mkdir -p ${STACK_ROOT}/programs/x86_64-linux/
	cp -s ${DISTDIR}/ghc-tinfo6-*.tar.xz ${STACK_ROOT}/programs/x86_64-linux/ || die

	stack ${STACK_ARGS} setup || die
}

# @FUNCTION: stack_src_compile
# @DESCRIPTION:
# Compiles the package.
stack_src_compile() {
	debug-print-function ${FUNCNAME} "$@"
	einfo "Compiling"

	# Setting PATH to suppress warning
	env PATH="${HOME}/.local/bin:${PATH}" stack ${STACK_ARGS} install || die
}

# @FUNCTION: stack_src_install
# @DESCRIPTION:
stack_src_install() {
	debug-print-function ${FUNCNAME} "$@"
	einfo "Installing"

	# Copying installed files instead of using 'install --local-bin-path' as it doesn't seem to play well with --stack-root
	dobin ${HOME}/.local/bin/*
}

