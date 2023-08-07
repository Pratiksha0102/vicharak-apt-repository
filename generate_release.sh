#!/usr/bin/env bash
set -e

do_hash() {
	HASH_NAME=$1
	HASH_CMD=$2
	echo "${HASH_NAME}:"
	find . -type f | cut -c3- | sort | while read -r f; do
		if [ "$f" = "Release" ]; then
			continue
		fi
		echo " $(${HASH_CMD} "${f}" | cut -d" " -f1) $(wc -c "${f}")"
	done
}

cat <<EOF
Origin: Vicharak APT Repository
Label: Vichark-APT
Suite: stable
Codename: stable
Version: 1.0
Architectures: arm64
Components: main
Description: Vicharak Debian/Ubuntu apt software repository
Date: $(date -Ru)
EOF
do_hash "MD5Sum" "md5sum"
do_hash "SHA1" "sha1sum"
do_hash "SHA256" "sha256sum"
