#!/bin/sh

set -e

_all_tools="
	bowtie2
	fastqc
	sra-tools
	trimmomatic
	trinity
	"

update() {
	[ -z "$1" ] && return 1

	_tool_name=$1
	_tools_dir=tools/$_tool_name
	_ports_dir=ports/$_tool_name

	[ ! -d "$_ports_dir" ] && return 1

	_tool_ver=$( grep 'pkgver=.*' $_ports_dir/APKBUILD | cut -d= -f2 )

	mkdir -p $_tools_dir
	sed \
		-e 's/%%TOOL_NAME%%/'"$_tool_name"'/g' \
		-e 's/%%ALPINE_VERSION%%/'"$ALPINE_VERSION"'/g' \
		-e 's/%%PKG_PUBKEY_URL%%/'"$PKG_PUBKEY_URL"'/g' \
		-e 's/%%PKG_PUBKEY%%/'"$PKG_PUBKEY"'/g' \
		-e 's/%%PKG_REPOSITORY%%/'"$PKG_REPOSITORY"'/g' \
		Dockerfile.template \
		> $_tools_dir/Dockerfile
}

usage() {
	cat <<-EOF
		Usage: update.sh [OPTION]... [TOOL]...

		Options:
		    -a  Set alpine version
		    -h  Show this help
		    -k
		    -p
		    -r
	EOF

	exit 0
}

while getopts "a:hk:p:r:" opt; do
	case $opt in
		a) ALPINE_VERSION=$OPTARG ;;
		h) usage ;;
		k) PKG_PUBKEY_URL=$OPTARG ;;
		p) PKG_PUBKEY=$OPTARG ;;
		r) PKG_REPOSITORY=$OPTARG ;;
	esac
done

ALPINE_VERSION=${ALPINE_VERSION:-3.8}

if [ "$#" -eq 0 ]; then
	set -- "$_all_tools"
fi

for tool in $@; do
	update $tool
done

