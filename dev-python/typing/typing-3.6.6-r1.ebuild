# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Type Hints for Python"
HOMEPAGE="https://docs.python.org/3/library/typing.html https://pypi.org/project/typing/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="amd64 arm64 x86 amd64-linux x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""

python_test() {
	if [[ ${EPYTHON} == python2* || ${EPYTHON} == pypy ]]; then
		cd "${S}"/python2 || die
	else
		cd "${S}"/src || die
	fi

	"${PYTHON}" test_typing.py || die "tests failed under ${EPYTHON}"
}
