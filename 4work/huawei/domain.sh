#!/bin/bash

set -e

if [[ -z "$3" ]]; then
	echo "Usage: $0 <domain> <passwd> <email>"
	echo "e.g. $0 o00403675 passwd ouyangxiongyi@huawei.com"
	exit 1
fi

domain="$1"
passwd="$2"
email="$3"

cat <<EOF >> ~/.bashrc_ignored
export http_proxy="%DOMAIN:%PASSWD@172.18.32.221:8080"
export https_proxy="%DOMAIN:%PASSWD@172.18.32.221:8080"
export ftp_proxy="%DOMAIN:%PASSWD@172.18.32.221:8080"

function on()
{
	export http_proxy="%DOMAIN:%PASSWD@172.18.32.221:8080"
	export https_proxy="%DOMAIN:%PASSWD@172.18.32.221:8080"
	export ftp_proxy="%DOMAIN:%PASSWD@172.18.32.221:8080"
}

function off()
{
	unset http_proxy
	unset https_proxy
	unset ftp_proxy
}

export NO_PROXY="rnd-dockerhub.huawei.com"
EOF

cat <<EOF >> ~/.gitconfig_ignored
[user]
	name = %DOMAIN
	email = %EMAIL

[http]
	proxy = http://%DOMAIN:%PASSWD@172.18.32.221:8080
	sslVerify = false
[https]
	proxy = http://%DOMAIN:%PASSWD@172.18.32.221:8080
EOF

sed -i -e 's,%DOMAIN,'"$domain"',g' \
	-e 's,%PASSWD,'"$passwd"',g' \
	-e 's,%EMAIL,'"$email"',g' ~/.gitconfig_ignored ~/.bashrc_ignored
