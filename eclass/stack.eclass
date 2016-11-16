# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

# @ECLASS: stack.eclass
# @MAINTAINER: Reuben D'Netto <rdnetto@gmail.com>
# @AUTHOR: Reuben D'Netto <rdnetto@gmail.com>
# @BLURB: An eclass for programs compiled using Haskell Stack.
# @DESCRIPTION:
# This eclass allows Haskell programs to be compiled using Stack,
# which pins library versions using resolvers.
# This enables programs using different library versions to be installed side-by-side.
# It also provides a choice of dependency on stack or stack-bin, enabling these packages
# to be installed without pulling in the entire Haskell platform.

# Either stack package can be used.
DEPEND="|| ( dev-haskell/stack dev-haskell/stack-bin )"

EXPORT_FUNCTIONS src_configure src_compile src_install

STACK_ARGS="--stack-root /var/tmp/stack"

# @FUNCTION: stack_src_configure
# @DESCRIPTION:
# Configure the package.
stack_src_configure() {
	# Make sure working directory exists
	mkdir -p /var/tmp/stack

	stack ${STACK_ARGS} setup || die
}

# @FUNCTION: stack_src_compile
# @DESCRIPTION:
# Compiles the package.
stack_src_compile() {
	debug-print-function ${FUNCNAME} "$@"

	# Setting PATH to suppress warning
	env PATH="${HOME}/.local/bin:${PATH}" stack ${STACK_ARGS} install --install-ghc || die
}

# @FUNCTION: stack_src_install
# @DESCRIPTION:
stack_src_install() {
	debug-print-function ${FUNCNAME} "$@"

	# Copying installed files instead of using 'install --local-bin-path' as it doesn't seem to play well with --stack-root
	dobin ${HOME}/.local/bin/*
}
