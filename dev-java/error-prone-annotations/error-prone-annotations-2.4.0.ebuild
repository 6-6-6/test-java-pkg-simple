# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom error-prone-2.4.0/annotations/pom.xml --download-uri https://github.com/google/error-prone/archive/v2.4.0.tar.gz --slot 0 --keywords "~amd64" --ebuild error-prone-annotations-2.4.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="com.google.errorprone:error_prone_annotations:2.4.0"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Sonatype helps open source projects to set up Maven repositories on https://oss.sonatype.org/"
HOMEPAGE="http://nexus.sonatype.org/oss-repository-hosting.html/error_prone_parent/error_prone_annotations"
SRC_URI="https://github.com/google/error-prone/archive/v${PV}.tar.gz -> ${P}-sources.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="error-prone-${PV}/annotations/src/main/java"
JAVA_RESOURCE_DIRS=(
	"error-prone-${PV}/annotations/src/main/java"
)
