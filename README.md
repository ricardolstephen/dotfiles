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
```

3. Install configs, and be sure to save backups in local/defaults.

- bash\_profile - plain bash\_profile
- bash_aliases - bash goodies
- init.el - emacs startup script
- inputrc - readline configuration
- screenrc - screen configuration

Others (no install)
- modules.el - helper for the emacs startup script
- scripts/


4. Install emacs packages
   - Start emacs
   - package-refresh-contents
   - package-install-selected-packages
   - save-buffers-kill-emacs
