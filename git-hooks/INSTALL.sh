#!/bin/bash
# Usage: git-hooks/INSTALL.sh
# Note run from repo root

if [[ "`pwd`" == *git-hooks* ]]; then
  echo "Run from repo root instead. ie. cd ..; git-hooks/INSTALL.sh"
  exit 1;
fi

unlink .git/hooks/pre-commit 2>/dev/null
ln -s ../../git-hooks/pre-commit.sh .git/hooks/pre-commit
