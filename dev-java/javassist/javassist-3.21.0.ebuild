# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom javassist-rel_3_21_0_ga/pom.xml --download-uri https://github.com/jboss-javassist/javassist/archive/rel_3_21_0_ga.tar.gz --slot 3 --keywords "~amd64 ~arm64 ~ppc64 ~x86 ~amd64-linux ~x86-linux ~x86-macos" --ebuild javassist-3.21.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.javassist:javassist:3.21.0-GA"
JAVA_TESTING_FRAMEWORKS="junit"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Javassist (JAVA programming ASSISTant) makes Java bytecode manipulation simple. It is a class library for editing bytecodes in Java."
HOMEPAGE="http://www.javassist.org/"
SRC_URI="https://github.com/jboss-${PN}/${PN}/archive/rel_3_21_0_ga.tar.gz -> ${P}-sources.tar.gz"
LICENSE="Apache-2.0 LGPL-2.1 MPL-1.1"
SLOT="3"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86 ~amd64-linux ~x86-linux ~x86-macos"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_NEEDS_TOOLS=1
JAVA_SRC_DIR="${PN}-rel_3_21_0_ga/src/main"
JAVA_MAIN_CLASS="javassist.CtClass"

JAVA_TEST_GENTOO_CLASSPATH="junit"
JAVA_TEST_SRC_DIR="${PN}-rel_3_21_0_ga/src/test"
