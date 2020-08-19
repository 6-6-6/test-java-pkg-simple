# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom jboss-marshalling-1.4.11.Final/river/pom.xml --download-uri https://github.com/jboss-remoting/jboss-marshalling/archive/1.4.11.Final.tar.gz --slot 0 --keywords "~amd64" --ebuild jboss-marshalling-river-1.4.11.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.jboss.marshalling:jboss-marshalling-river:1.4.11.Final"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JBoss Marshalling River Implementation"
HOMEPAGE="http://www.jboss.org/jboss-marshalling-parent/jboss-marshalling-river"
SRC_URI="https://github.com/jboss-remoting/jboss-marshalling/archive/${PV}.Final.tar.gz -> ${P}-sources.tar.gz"
LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: jboss-marshalling-${PV}.Final/river/pom.xml
# org.jboss.marshalling:jboss-marshalling:1.4.11.Final -> >=dev-java/jboss-marshalling-1.4.11:0

CDEPEND="
	>=dev-java/jboss-marshalling-1.4.11:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	dev-java/jboss-modules:0
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jboss-marshalling"
JAVA_CLASSPATH_EXTRA="jboss-modules"
JAVA_SRC_DIR="jboss-marshalling-${PV}.Final/river/src/main/java"
JAVA_RESOURCE_DIRS=(
	"jboss-marshalling-${PV}.Final/river/src/main/resources"
)

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="jboss-marshalling-${PV}.Final/river/src/test/java"
JAVA_TEST_EXCLUDES=( "org.jboss.marshalling.river.ReadWriteTest" )
