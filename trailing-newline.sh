#!/bin/bash
#
# Pre-commit hook to add a trailing newline if missing. Based on
# https://gist.github.com/Robotic-Brain/ffafe886a9e4b7b9e946318817440abe
# and https://gist.github.com/johnjohndoe/4024222.
#
# Author: Philip Darke <philip@philipdarke.com>
# Date: 8 July 2022

# Get staged files
files=$(git diff-index --name-status --cached HEAD | grep -v ^D | cut -c3-)

# Add trailing newline if missing
error=0
if [ -n "$files" ]; then
  for f in $files; do
    if ! [[ $f =~ .*\.($1) ]]; then
      if [ "$(tail -n 1 $f)" != '' ]; then      
        echo "Error! Trailing newline added to ${f}" 1>&2
        error=1
        echo >> $f
      fi
    fi
  done
fi

exit $error

