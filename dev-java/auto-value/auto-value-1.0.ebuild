# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE=""
MAVEN_ID="com.google.auto.value:auto-value:1.0"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Immutable value-type code generation for Java 7+."
HOMEPAGE="https://github.com/google/auto/tree/master/value"
SRC_URI="https://repo1.maven.org/maven2/com/google/auto/value/${PN}/${PV}/${P}.jar"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""

RDEPEND=">=virtual/jre-1.8"
DEPEND=">=virtual/jdk-1.8"

src_compile() {
	cp "${DISTDIR}"/${P}.jar ${JAVA_JAR_FILENAME}\
		|| die
}
