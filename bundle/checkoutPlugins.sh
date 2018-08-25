#!/bin/bash
cd ~/.vim/bundle/YouCompleteMe/
git clone https://github.com/Valloric/YouCompleteMe.git
mv YouCompleteMe/* .
rm -rf YouCompleteMe/

cd ~/.vim/bundle/nerdtree
git clone https://github.com/scrooloose/nerdtree.git
mv nerdtree/* .
rm -rf nerdtree/

cd ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline.git
mv vim-airline/* .
rm -rf vim-airline


