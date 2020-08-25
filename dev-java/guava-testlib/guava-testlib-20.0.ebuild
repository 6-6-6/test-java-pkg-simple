# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom guava-20.0/guava-testlib --download-uri https://github.com/google/guava/archive/v20.0.tar.gz --slot 20 --keywords "~amd64" --ebuild guava-testlib-20.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="com.google.guava:guava-testlib:20.0"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Guava testlib is a set of java classes used for more convenient unit testing - particularly to assist the tests for Guava itself."
HOMEPAGE="https://github.com/google/guava/guava-testlib"
SRC_URI="https://github.com/google/guava/archive/v${PV}.tar.gz -> ${P}-sources.tar.gz"
LICENSE="Apache-2.0"
SLOT="20"
KEYWORDS="~amd64"

# Common dependencies
# POM: guava-${PV}/${PN}
# com.google.code.findbugs:jsr305:1.3.9 -> >=dev-java/jsr305-3.0.1:0
# com.google.errorprone:error_prone_annotations:2.0.12 -> >=dev-java/error-prone-annotations-2.0.14:0
# com.google.guava:guava:20.0 -> >=dev-java/guava-20.0:20
# com.google.j2objc:j2objc-annotations:1.1 -> >=dev-java/j2objc-annotations-1.2:0
# junit:junit:4.8.2 -> >=dev-java/junit-4.12:4

CDEPEND="
	>=dev-java/error-prone-annotations-2.0.14:0
	>=dev-java/guava-20.0:20
	>=dev-java/j2objc-annotations-1.2:0
	>=dev-java/jsr305-3.0.1:0
	>=dev-java/junit-4.12:4
"

# Compile dependencies
# POM: guava-${PV}/${PN}
# test? com.google.truth:truth:0.28 -> >=dev-java/truth-0.30:0

DEPEND="
	virtual/jdk:1.8
	${CDEPEND}
	test? (
		>=dev-java/truth-0.30:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jsr305,error-prone-annotations,guava-20,j2objc-annotations,junit-4"
JAVA_SRC_DIR="guava-${PV}/${PN}/src"
JAVA_RESOURCE_DIRS=(
	"guava-${PV}/${PN}/src"
)

JAVA_TEST_GENTOO_CLASSPATH="truth"
JAVA_TEST_SRC_DIR="guava-${PV}/${PN}/test"
JAVA_TEST_RESOURCE_DIRS=(
	"guava-${PV}/${PN}/test"
)
