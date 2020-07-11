

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

