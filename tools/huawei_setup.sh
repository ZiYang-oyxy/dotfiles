#!/bin/bash

if [[ -z "$3" ]]; then
	echo "Usage: $0 <domain> <passwd> <email>"
	echo "e.g. $0 o00403675 passwd ouyangxiongyi@huawei.com"
	exit 1
fi

domain="$1"
passwd="$2"
email="$3"

sed -i -e 's,%DOMAIN,'"$domain"',g' \
	-e 's,%PASSWD,'"$passwd"',g' \
	-e 's,%EMAIL,'"$email"',g' ~/.gitconfig_ignored ~/.bashrc_ignored
