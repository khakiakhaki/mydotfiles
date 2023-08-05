#!/bin/bash

if [ -d "~/.tmux "];then
	rm -rf ~/.tmux
fi
sudo ln -s ~/.config/tmux ~/.tmux

if [ -d "~/.zshrc"];then
	rm -rf ~/.zshrc
fi
sudo ln -s ~/.congig/.zshrc ~/.zhsrc



