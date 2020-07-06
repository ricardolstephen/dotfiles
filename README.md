

# Installation

- mkdir local
- mkdir local/defaults

## Hello World

Spacemacs configuration layers
```
dotspacemacs-configuration-layers
   '(
     yaml
     python
     java
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
     )
```


dotspacemacs/user-config
(load-file "/Users/leander/Documents/Storage/dotfiles/configs/emacs.el")

dotspacemacs-excluded-packages '(git-gutter+ git-gutter-fringe+)

