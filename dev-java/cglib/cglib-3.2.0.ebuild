# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom cglib-RELEASE_3_2_0/cglib/pom.xml --download-uri https://github.com/cglib/cglib/archive/RELEASE_3_2_0.tar.gz --slot 3 --keywords "~amd64" --ebuild cglib-3.2.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="cglib:cglib:3.2.0"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="cglib is a powerful, high performance and quality Code Generation Library, It is used to extend JAVA classes and implements interfaces at runtime."
HOMEPAGE="https://github.com/cglib/cglib/cglib"
SRC_URI="https://github.com/${PN}/${PN}/archive/RELEASE_3_2_0.tar.gz -> ${P}-sources.tar.gz"
LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS="~amd64"

# Common dependencies
# POM: ${PN}-RELEASE_3_2_0/${PN}/pom.xml
# org.apache.ant:ant:1.9.4 -> >=dev-java/ant-core-1.10.7:0
# org.ow2.asm:asm:5.0.3 -> >=dev-java/asm-8.0.1:7

CDEPEND="
	>=dev-java/ant-core-1.10.7:0
	>=dev-java/asm-8.0.1:7
"

DEPEND="
	virtual/jdk:1.8
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="ant-core,asm-7"
JAVA_SRC_DIR="${PN}-RELEASE_3_2_0/${PN}/src/main/java"
JAVA_RESOURCE_DIRS=(
	"${PN}-RELEASE_3_2_0/${PN}/src/main/resources"
	"${PN}-RELEASE_3_2_0/${PN}/.."
)

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="${PN}-RELEASE_3_2_0/${PN}/src/test/java"

JAVA_TEST_EXCLUDES=(
	"net.sf.cglib.CodeGenTestCase"
	"net.sf.cglib.TestAll"
	"net.sf.cglib.TestGenerator"
	"net.sf.cglib.proxy.TestInterceptor"
)
