#!/bin/bash
echo -e "\033[0;32mPreview Jekyll Site...\033[0m"

# Live Jekyll
#bundle exec jekyll serve --port 4000 --host node.tel.my.id --watch
setsid bundle exec jekyll serve --port 4000 --host 192.168.43.2 --watch --force_polling &>/dev/null </dev/null &
