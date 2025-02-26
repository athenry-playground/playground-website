#!/usr/bin/env bash

site_dir="$(dirname "$0")/../jekyll_files/_site"

lftp -c "
open --user \"$FTP_USERNAME\" --password \"$FTP_PASSWORD\" $FTP_SERVER
mirror --reverse --delete --no-perms $site_dir /httpdocs
"
