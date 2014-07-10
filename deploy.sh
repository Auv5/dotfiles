#!/bin/sh

command -v zsh >/dev/null 2>&1 || { echo >&2 "This script requires zsh to be installed and on PATH.  Aborting."; exit 1; }
command -v vim >/dev/null 2>&1 || { echo >&2 "This script requires vim to be installed and on PATH. Aborting."; exit 1; }

git submodule update --init --recursive;

for f in .*; 
do
if [ "$f" != "." ] && [ "$f" != ".." ] && [ "$f" != ".git" ] && [ "$f" != ".gitmodules" ] && [ ! -e ~/$f ]; then
  ln -s `pwd`/$f ~/$f;
fi
done;

+vim -E -c BundleInstall -c qall
