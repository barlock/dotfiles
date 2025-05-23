#!/usr/bin/env zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ZSH_CUSTOM_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM_DIR}/plugins/zsh-syntax-highlighting || true
git clone https://github.com/reobin/typewritten.git $ZSH_CUSTOM_DIR/themes/typewritten || true
ln --force -s "$ZSH_CUSTOM_DIR/themes/typewritten/typewritten.zsh-theme" "$ZSH_CUSTOM_DIR/themes/typewritten.zsh-theme"
ln --force -s "$ZSH_CUSTOM_DIR/themes/typewritten/async.zsh" "$ZSH_CUSTOM_DIR/themes/async"

mkdir -p ~/.vim/backups
mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/undo

rsync --exclude ".git/" \
  --exclude ".DS_Store" \
  --exclude ".osx" \
  --exclude "bootstrap.sh" \
  --exclude "install.sh" \
  --exclude "brew.sh" \
  --exclude "README.md" \
  -avh --no-perms . ~;