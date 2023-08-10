#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/403485/how-to-generate-the-release-file-on-a-local-package-repository

if [ ! -d pool ]; then
	echo "pool directory not found!"
	exit 1
fi

if [ ! -d dists ]; then
	echo "dists directory not found!"
	exit 1
fi

apt-ftparchive generate -c=aptftp.conf aptgenerate.conf
apt-ftparchive release -c=aptftp.conf dists/stable >dists/stable/Release

pgp_key=$(gpg --list-keys | grep vicharak | awk '{print $1}')
if [ -z "$pgp_key" ]; then
	echo "Vicharak PGP key not found!"
	exit 1
fi

if [ -f dists/stable/Release.gpg ]; then
	rm -f dists/stable/Release.gpg
fi
gpg --default-key vicharak -abo dists/stable/Release.gpg dists/stable/Release

if [ -f dists/stable/InRelease ]; then
	rm -f dists/stable/InRelease
fi
gpg --default-key vicharak --clear-sign --output dists/stable/InRelease dists/stable/Release
