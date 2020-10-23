#!/bin/bash

cd $HOME/dotfiles


# 移動できたらリンクを実行する
for f in `find .??*`
do
  # .gitは無視
  if [ $f = .git* ]; then
    continue
  fi

  ln -snfv "$DOTPATH/$f" "$HOME/$f"
done
