for f in .*; do
    if [ -h ~/$f ]; then
        rm ~/$f
    fi
done
