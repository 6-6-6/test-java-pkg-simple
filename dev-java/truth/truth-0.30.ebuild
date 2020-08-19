# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom truth-release_0_30/core/pom.xml --download-uri https://github.com/google/truth/archive/release_0_30.tar.gz --slot 0 --keywords "~amd64" --ebuild truth-0.30.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="com.google.truth:truth:0.30"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Parent metdata for Truth, a pure-java, strongly typed testing proposition framework."
HOMEPAGE="http://github.com/google/truth/truth"
SRC_URI="https://github.com/google/${PN}/archive/release_0_30.tar.gz -> ${P}-sources.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: ${PN}-release_0_30/core/pom.xml
# com.google.code.findbugs:jsr305:3.0.1 -> >=dev-java/jsr305-3.0.1:0
# com.google.errorprone:error_prone_annotations:2.0.8 -> >=dev-java/error-prone-annotations-2.0.14:0
# com.google.guava:guava:19.0 -> >=dev-java/guava-20.0:20
# junit:junit:4.10 -> >=dev-java/junit-4.12:4

CDEPEND="
	>=dev-java/error-prone-annotations-2.0.14:0
	>=dev-java/guava-20.0:20
	>=dev-java/jsr305-3.0.1:0
	>=dev-java/junit-4.12:4
"

# Compile dependencies
# POM: ${PN}-release_0_30/core/pom.xml
# com.google.auto.value:auto-value:1.0 -> >=dev-java/auto-value-1.0:0
# com.google.gwt:gwt-user:2.8.0-beta1 -> >=dev-java/gwt-2.8.2:2.8

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	>=dev-java/auto-value-1.0:0
	>=dev-java/gwt-2.8.2:2.8
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jsr305,error-prone-annotations,guava-20,junit-4"
JAVA_CLASSPATH_EXTRA="auto-value,gwt-2.8"
JAVA_SRC_DIR="${PN}-release_0_30/core/src/main/java"
JAVA_RESOURCE_DIRS=(
	"${PN}-release_0_30/core/src/main/java"
)

JAVA_RM_FILES=( "${JAVA_SRC_DIR}/com/google/common/truth/super/com/google/common/truth/Platform.java" )
