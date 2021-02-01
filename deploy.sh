#!/bin/bash
echo -e "\033[0;32mDeploy Jekyll ke repository...\033[0m"

#  generate konten Jekyll
bundle exec jekyll build

# tambahkan perubahan
git add .

# tambah commit
msg="Update website `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# push ke private repository
git push github master
