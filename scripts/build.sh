#!/bin/sh -l

curl -s https://api.github.com/repos/umutphp/hacker-laws-cli/releases/latest \
| grep "browser_download_url.*linux_amd64*.tar.gz" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -q -

tar -xzvf hacker-laws-cli*.tar.gz

cp hacker-laws-cli /
