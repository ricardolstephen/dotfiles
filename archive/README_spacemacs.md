# Dotfiles

Dotfiles




## Installation

```
mkdir local
mkdir local/defaults

# Install dotfiles/configs

touch ~/.

# Install emacs packages
#   package-refresh-contents
#   package-install-selected-packages

```

Manifest

- bash\_profile - plain
- bash_aliases - bash goodies
- init.el - emacs startup script
- inputrc - readline configuration
- screenrc - screen configuration


- modules.el - helper for the emacs startup script


# Installation

- mkdir local
- mkdir local/defaults

## Hello World

https://github.com/syl20bnr/spacemacs
Install the develop branch of spacemacs

Spacemacs configuration layers
```
   '(
     yaml
     python
     java
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     emacs-lisp
     git
     helm
     lsp
     markdown
     multiple-cursors
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
     treemacs
     )
```
```
(spell-checking :variables spell-checking-enable-by-default nil)
```


<Note, use the actual path specific to the machine>
dotspacemacs/user-config
(load-file "/Users/leander/Documents/Storage/dotfiles/configs/emacs.el")

dotspacemacs-excluded-packages '(git-gutter+ git-gutter-fringe+)


## Hello R2

### groovy support

[ ] build this https://github.com/prominic/groovy-language-server
[ ] copy it to ~/groovy-lsp-all.jar

Reference: https://emacs-lsp.github.io/lsp-mode/page/lsp-groovy/
