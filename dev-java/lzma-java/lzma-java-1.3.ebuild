# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom lzma-java-lzma-java-1.3/pom.xml --download-uri https://github.com/jponge/lzma-java/archive/lzma-java-1.3.tar.gz --slot 0 --keywords "~amd64" --ebuild lzma-java-1.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="com.github.jponge:lzma-java:1.3"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="LZMA library for Java"
HOMEPAGE="http://jponge.github.com/lzma-java"
SRC_URI="https://github.com/jponge/${PN}/archive/${P}.tar.gz -> ${P}-sources.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Compile dependencies
# POM: ${PN}-${P}/pom.xml
# test? commons-io:commons-io:1.4 -> >=dev-java/commons-io-2.4:1
# test? junit:junit:4.7 -> >=dev-java/junit-4.12:4

DEPEND="
	>=virtual/jdk-1.8:*
	test? (
		>=dev-java/commons-io-2.4:1
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="${PN}-${P}/src/main/java"

JAVA_TEST_GENTOO_CLASSPATH="commons-io-1,junit-4"
JAVA_TEST_SRC_DIR="${PN}-${P}/src/test/java"
JAVA_TEST_RESOURCE_DIRS=(
	"${PN}-${P}/src/test/resources"
)
