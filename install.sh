#!/bin/bash

DOTPATH=$HOME/dotfiles


for f in `find .??*`
do
  # .git関係は無視
  if [ $f = .git || $f = .gitignore ]; then
    continue
  fi

  ln -snfv "$DOTPATH/$f" "$HOME/$f"
done
