#!/usr/bin/env bash

pkg.link() {
    # Link vimrc
    fs.link_file vimrc

    # Link package into ~/.vim
    fs.link_file "$PKG_PATH"
}

##############################################################################

pkg.install() {
    # Create vim folders
    mkdir -p $PKG_PATH/{undo,swap,spell,autoload,plugged,session}

    # Run vim and install plugins
    vim +PlugInstall +qall
}

##############################################################################

pkg.pull() {
    # Update dot-vim repo
    git.pull

    # Update plugins (clean than install and update)
    vim +PlugClean! +PlugInstall! +qall
}

##############################################################################

pkg.unlink() {
    # Unlink
    rm $ELLIPSIS_HOME/.vimrc
    rm $ELLIPSIS_HOME/.vim
}

##############################################################################
