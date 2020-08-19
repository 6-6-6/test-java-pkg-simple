# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom java-classmate-classmate-1.5.1/pom.xml --download-uri https://github.com/FasterXML/java-classmate/archive/classmate-1.5.1.tar.gz --slot 3 --keywords "~amd64" --ebuild classmate-1.5.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="com.fasterxml:classmate:1.5.1"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Library for introspecting types with full generic information including resolving of field and method types."
HOMEPAGE="https://github.com/FasterXML/java-classmate"
SRC_URI="https://github.com/FasterXML/java-${PN}/archive/${P}.tar.gz -> ${P}-sources.tar.gz"
LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="java-${PN}-${P}/src/main/java"
JAVA_RESOURCE_DIRS=(
	"java-${PN}-${P}/src/main/resources"
)

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="java-${PN}-${P}/src/test/java"
