#!/bin/bash

cd $HOME/dotfiles

if [ $? -ne 0 ]; then
    echo "not found: $DOTPATH" >&2
fi

# 移動できたらリンクを実行する
for f in `find .??*`
  do
    # .gitは無視
    if [ $f = .git* ]; then
      continue
    fi

    ln -snfv "$DOTPATH/$f" "$HOME/$f"
  done
