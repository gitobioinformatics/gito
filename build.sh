#!/bin/sh

set -e

_all_tools="
	bowtie2
	fastqc
	sra-tools
	trimmomatic
	trinity
	"

build() {
	[ -z "$1" ] && return 1

	_tool_name=$1
	_tool_dir=tools/$_tool_name

	[ ! -d "$_tool_dir" ] && return 1

	_ports_dir=ports/$_tool_name

	[ ! -d "$_ports_dir" ] && return 1

	_tool_ver=$( grep 'pkgver=.*' $_ports_dir/APKBUILD | cut -d= -f2 )
	_tool_tag="$REPOSITORY_USER"/"$_tool_name":"$_tool_ver"

	_build_args="--tag $_tool_tag"
	
	[ -n "$DOCKER_NETWORK" ] && _build_args="$_build_args --network $DOCKER_NETWORK"
	[ -n "$PKG_REPOSITORY" ] && _build_args="$_build_args --build-arg PKG_REPOSITORY=$PKG_REPOSITORY"
	[ -n "$PKG_PUBKEY_URL" ] && _build_args="$_build_args --build-arg PKG_PUBKEY_URL=$PKG_PUBKEY_URL"
	[ -n "$PKG_PUBKEY" ] && _build_args="$_build_args --build-arg PKG_PUBKEY=$PKG_PUBKEY"
	
	docker build $_build_args "$_tool_dir"
}

usage() {
	cat <<-EOF
		Usage: build.sh [OPTION]... [TOOL]...

		Options:
		    -h  Show this help
		    -k
		    -n  
		    -p
		    -r
		    -u
	EOF

	exit 0
}

while getopts "hk:n:p:r:u:" opt; do
	case $opt in
		h) usage ;;
		k) PKG_PUBKEY_URL=$OPTARG ;;
		n) DOCKER_NETWORK=$OPTARG ;;
		p) PKG_PUBKEY=$OPTARG ;;
		r) PKG_REPOSITORY=$OPTARG ;;
		u) REPOSITORY_USER=$OPTARG ;;
	esac
done

shift $((OPTIND-1))

PKG_REPOSITORY=${PKG_REPOSITORY:-"http://local.repository/packages/testing"}
PKG_PUBKEY_URL=${PKG_PUBKEY:-"http://local.repository/keys/packager_key.rsa.pub"}
PKG_PUBKEY=${PKG_PUBKEY:-${PKG_PUBKEY_URL##*/}}

REPOSITORY_USER=${REPOSITORY_USER:-gitobioinformatics}

if [ "$#" -eq 0 ]; then
	set -- $_all_tools
fi

for tool in $@; do
	build $tool
done

