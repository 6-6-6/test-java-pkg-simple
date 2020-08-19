# Copyright 2016-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="https://github.com/6-6-6/java-ebuilder"
	KEYWORDS="amd64"
else
	SRC_URI="https://gitweb.gentoo.org/proj/java-ebuilder.git/snapshot/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

inherit java-pkg-2 java-pkg-simple prefix ${ECLASS}

DESCRIPTION="Java team tool for semi-automatic creation of ebuilds from pom.xml"
HOMEPAGE="https://github.com/gentoo/java-ebuilder"

LICENSE="GPL-2"
SLOT="0"

DEPEND=">=virtual/jdk-1.8"
RDEPEND=">=virtual/jre-1.8
	sys-process/parallel
	>=dev-java/maven-bin-3"

S="${WORKDIR}/${P}"

JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=("src/main/resources")

JAVA_LAUNCHER_FILENAME=${PN}
JAVA_MAIN_CLASS="org.gentoo.java.ebuilder.Main"

src_prepare() {
	default
	hprefixify scripts/{{tree,meta}.sh,movl} java-ebuilder.conf
}

src_install() {
	java-pkg-simple_src_install

	insinto /var/lib/${PN}
	doins -r maven
	dodir /var/lib/${PN}/{poms,cache}
	keepdir /var/lib/${PN}/{poms,cache}

	dodoc README maven.conf

	exeinto /usr/lib/${PN}
	doexe scripts/{tree,meta}.sh
	doexe "${FILESDIR}"/simple_formatter
	# TODO: merge them into java-ebuilder when stable
	#cp -r ${FILESDIR}/scripts/* ${ED}/usr/lib/${PN}/ || die "failed to install scripts"

	dobin scripts/movl

	insinto /etc
	doins java-ebuilder.conf
}