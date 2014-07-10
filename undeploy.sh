for f in .*; do
    if [ -h ~/$f ]; then
        rm ~/$f
    fi
done

rm -rf .emacs.d/elpa
mv .vim/bundle/Vundle.vim .vim/bundle/.gitignore .vim
rm -rf .vim/bundle/*
mv .vim/Vundle.vim .vim/.gitignore .vim/bundle/

