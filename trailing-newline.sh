#!/bin/bash
#
# Pre-commit hook to flag if a trailing newline if missing. Based on
# https://gist.github.com/Robotic-Brain/ffafe886a9e4b7b9e946318817440abe
# and https://gist.github.com/johnjohndoe/4024222.
#
# Author: Philip Darke <philip@philipdarke.com>
# Date: 26 July 2022

# Commited files
if git rev-parse --verify HEAD >/dev/null 2>&1
then
  against=HEAD
else
  against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi
files=$(git diff-index --cached --name-only --diff-filter=d "$against")

# Check each file unless extension is excluded
result=0
if [ -n "$files" ]; then
  for f in $files; do
    if ! [[ $f =~ .*\.($1) ]]; then
      if [ -n "$(git cat-file blob "$(git ls-files --stage "$f" | awk '{print $2}')" | tail -c1 - )" ]; then
        echo "Trailing newline missing from ${f}" 1>&2
        result=1
      fi
    fi
  done
fi

exit $result
