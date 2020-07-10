#!/bin/bash

DOTPATH=~/dotfiles

# git が使えるなら git
if hash "git"; then
    git clone --recursive "$GITHUB_URL" "$DOTPATH"

# 使えない場合は curl か wget を使用する
elif hash "curl" || hash "wget"; then
    tarball="https://github.com/b4b4r07/dotfiles/archive/master.tar.gz"

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

cd ~/dotfiles
if [ $? -ne 0 ]; then
    echo "not found: $DOTPATH" >&2
fi

# 移動できたらリンクを実行する
for f in .??*
  do
    [ "$f" = ".git" ] && continue

    ln -snfv "$DOTPATH/$f" "$HOME/$f"
  done
