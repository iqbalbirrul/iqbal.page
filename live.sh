#!/bin/bash
echo -e "\033[0;32mPreview Jekyll Site...\033[0m"

# Live Jekyll
#bundle exec jekyll serve --port 4000 --host localhost --watch
setsid bundle exec jekyll serve --port 4000 --host 192.168.10.2 --watch --force_polling &>/dev/null </dev/null &
