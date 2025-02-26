#!/usr/bin/env bash

# Check if required environment variables are set
if [ -z "$FTP_USERNAME" ]; then
  echo "Error: FTP_USERNAME must be set."
  exit 1
fi

if [ -z "$FTP_PASSWORD" ]; then
  echo "Error: FTP_PASSWORD must be set."
  exit 1
fi

if [ -z "$FTP_SERVER" ]; then
  echo "Error: FTP_SERVER must be set."
  exit 1
fi

site_dir="$(dirname "$0")/../jekyll_files/_site"

lftp -c "
open --user \"$FTP_USERNAME\" --password \"$FTP_PASSWORD\" $FTP_SERVER
mirror --reverse --delete --no-perms $site_dir /httpdocs
"
