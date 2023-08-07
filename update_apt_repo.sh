#!/usr/bin/env bash

if [ ! -d pool ]; then
	echo "pool directory not found!"
	exit 1
fi

if [ ! -d dists ]; then
	echo "dists directory not found!"
	exit 1
fi

dpkg-scanpackages --arch arm64 pool/ >dists/stable/main/binary-arm64/Packages

cat dists/stable/main/binary-arm64/Packages | gzip -9 >dists/stable/main/binary-arm64/Packages.gz

if [ ! -f generate_release.sh ]; then
	echo "Release generate file not found!"
	exit 1
fi

bash generate_release.sh >dists/stable/Release

pgp_key=$(gpg --list-keys | grep vicharak | awk '{print $1}')
if [ -z "$pgp_key" ]; then
	echo "Vicharak PGP key not found!"
	exit 1
fi

cat dists/stable/Release | gpg --default-key vicharak -abs >dists/stable/Release.gpg
cat dists/stable/Release | gpg --default-key vicharak -abs --clearsign >dists/stable/InRelease
