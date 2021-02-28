# Dotfiles

## Installation

1. Install requirements
```
sudo apt-get update
sudo apt-get install git screen emacs
sudo apt-get install curl tree
```

2. Setup dotfiles
```
git clone https://github.com/ricardolstephen/dotfiles
cd dotfiles
mkdir local
mkdir local/defaults
touch local/custom
git -C local init
```

3. Install configs, and be sure to backup relevant files in local/defaults.
```
ln -s $PWD/configs/screenrc ~/.screenrc
ln -s $PWD/configs/init.el ~/.emacs
ln -s $PWD/configs/bash_aliases ~/.bash_aliases
ln -s $PWD/configs/inputrc ~/.inputrc
# ln -s $PWD/configs/zsh_aliases ~/.zsh_aliases
```

4. Install emacs packages
   - Open emacs session
   - M-x package-refresh-contents
   - M-x package-install-selected-packages
   - Restart emacs session
