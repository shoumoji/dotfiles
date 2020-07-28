#!/bin/bash

DOTPATH=$HOME/dotfiles

echo "Git,NeoVim,python,pip,fishをインストールします"
sudo pacman -S --noconfirm neovim python python-pip fish

echo "dein.vimをインストールします"
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $HOME/.cache/dein/installer.sh
sh $HOME/.cache/dein/installer.sh

echo "dotfilesのインストールを開始します"

cd $DOTPATH
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

  # 既に存在しているディレクトリの場合、中身のリンクを貼る
  if [ -d "$HOME"/"$f" ]; then
    cd $f	
      for file in `find .??*`
        do
          ln -snfv "$DOTPATH/$f/$file" "$HOME/$f/$file"
        done
    cd ..
    continue
  fi
   
  ln -snfv "$DOTPATH/$f" "$HOME/$f"
done
