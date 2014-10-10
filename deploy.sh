#!/bin/sh

command -v git >/dev/null 2>&1 || { echo >&2 "This script requires Git to be installed and on PATH. Aborting."; exit 1; }
command -v wget >/dev/null 2>&1 || { echo >&2 "This script requires wget to be installed and on PATH. Aborting."; exit 1; }

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

if command -v vim > /dev/null 2>&1; then
    vim -E -c BundleInstall -c qall > /dev/null
else
    echo "Vim not installed...skipping bundle install."
fi

if command -v emacs > /dev/null 2>&1; then
    if emacs --version | grep "23" > /dev/null 2>&1; then
        wget http://bit.ly/pkg-el23 -O ~/.emacs.d/packages/package.el > /dev/null 2>&1
        echo "Downloaded Emacs 23 package.el"
    fi

    echo "Note: Loading Emacs for the first time after deploy may take a little longer due to package install."
else
    echo "Emacs not installed...skipping config"
fi

echo "Deployment successful!"
