#!/bin/sh

command -v zsh >/dev/null 2>&1 || { echo >&2 "This script requires zsh to be installed and on PATH.  Aborting."; exit 1; }
command -v vim >/dev/null 2>&1 || { echo >&2 "This script requires vim to be installed and on PATH. Aborting."; exit 1; }
command -v git >/dev/null 2>&1 || { echo >&2 "This script requires vim to be installed and on PATH. Aborting."; exit 1; }

echo "Checking Git submodules..."
git submodule update --init --recursive > /dev/null;

echo "Linking into home directory..."
for f in .*; 
do
if [ "$f" != "." ] && [ "$f" != ".." ] && [ "$f" != ".git" ] && [ "$f" != ".gitmodules" ] && [ ! -e ~/$f ]; then
  ln -s `pwd`/$f ~/$f;
fi
done;

echo "Launching Vim to install bundles..."
vim -E -c BundleInstall -c qall > /dev/null

echo "Note: Loading Emacs for the first time after deploy may take a little longer due to package install."

echo ""
echo "Deployment successful!"
