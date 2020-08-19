# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom guice-4.1/extensions/servlet/pom.xml --download-uri https://github.com/google/guice/archive/4.1.tar.gz --slot 4 --keywords "~amd64" --ebuild guice-servlet-4.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="com.google.inject.extensions:guice-servlet:4.1.0"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Guice is a lightweight dependency injection framework for Java 6 and above"
HOMEPAGE="https://github.com/google/guice/extensions-parent/guice-servlet"
SRC_URI="https://github.com/google/guice/archive/${PV}.tar.gz -> ${P}-sources.tar.gz"
LICENSE="Apache-2.0"
SLOT="4"
KEYWORDS="~amd64"

# Common dependencies
# POM: guice-${PV}/extensions/servlet/pom.xml
# com.google.inject:guice:4.1.0 -> >=dev-java/guice-4.1:4

CDEPEND="
	>=dev-java/guice-4.1:4
"

# Compile dependencies
# POM: guice-${PV}/extensions/servlet/pom.xml
# javax.servlet:servlet-api:2.5 -> java-virtuals/servlet-api:4.0
# POM: guice-${PV}/extensions/servlet/pom.xml
# test? cglib:cglib:3.2.0 -> >=dev-java/cglib-3.2.0:3
# test? com.google.guava:guava-testlib:19.0 -> >=dev-java/guava-testlib-20.0:20
# test? com.google.inject:guice:4.1.0 -> >=dev-java/guice-4.1:4
# test? junit:junit:4.11 -> >=dev-java/junit-4.12:4
# test? org.easymock:easymock:3.0 -> >=dev-java/easymock-3.3.1:3.2
# test? org.ow2.asm:asm:5.0.3 -> >=dev-java/asm-8.0.1:7

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	java-virtuals/servlet-api:4.0
	test? (
		>=dev-java/asm-8.0.1:7
		>=dev-java/cglib-3.2.0:3
		>=dev-java/easymock-3.3.1:3.2
		>=dev-java/guava-testlib-20.0:20
		>=dev-java/guice-4.1:4
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guice-4"
JAVA_CLASSPATH_EXTRA="servlet-api-4.0"
JAVA_SRC_DIR="guice-${PV}/extensions/servlet/src"
JAVA_RESOURCE_DIRS=(
	"guice-${PV}/extensions/servlet/src"
)

JAVA_TEST_GENTOO_CLASSPATH="cglib-3,guava-testlib-20,guice-4,junit-4,easymock-3.2,asm-7"
JAVA_TEST_SRC_DIR=(
	"guice-${PV}/extensions/servlet/test"
	"guice-${PV}/core/test/com/google/inject/Asserts.java"
)
JAVA_TEST_RESOURCE_DIRS=(
	"guice-${PV}/extensions/servlet/test"
)
JAVA_TEST_EXCLUDES=(
	"com.google.inject.servlet.ContinuingHttpServletRequestTest"
	"com.google.inject.servlet.AllTests"
)
