#!/bin/bash

DOTPATH=~/dotfiles
GITHUB_URL=https://github.com/shoumoji/dotfiles

# git が使えるなら git
if hash "git"; then
    git clone --recursive "$GITHUB_URL" "$DOTPATH"

# 使えない場合は curl か wget を使用する
elif hash "curl" || hash "wget"; then
    tarball="https://github.com/shoumoji/dotfiles"

    # どっちかでダウンロードして，tar に流す
    if hash "curl"; then
        curl -L "$tarball"

    elif hash "wget"; then
        wget -O - "$tarball"

    fi | tar zxv

    # 解凍したら，DOTPATH に置く
    mv -f dotfiles-master "$DOTPATH"

else
    echo "curl or wget required" >&2
fi

cd $HOME/dotfiles
if [ $? -ne 0 ]; then
    echo "not found: $DOTPATH" >&2
fi

# 移動できたらリンクを実行する
for f in `find .??*`
  do
    # .gitは無視
    [ "$f" = ".git" ] && continue

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
