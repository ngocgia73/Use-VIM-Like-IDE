https://www.embeddedarm.com/blog/tag-jumping-in-a-codebase-using-ctags-and-cscope-in-vim/
$wget http://cscope.sourceforge.net/cscope_maps.vim
$sudo apt-get install ctags
$sudo apt-get install cscope

#
# how to install youcompleteme with pathogen
#


$cd ~/.vim/bundle

$git clone https://github.com/valloric/youcompleteme


$cd youcompleteme

$git submodule update --init --recursive

#
# required python version >= 3.6
# gcc >= 7
# vim >= 8
# cmake


#
# how to install gcc
#

$https://linuxize.com/post/how-to-install-gcc-compiler-on-ubuntu-18-04/


#
# how to build vim from source 
#

$https://github.com/ycm-core/YouCompleteMe/wiki/Building-Vim-from-source

$cd vim/src

$./configure --with-features=huge --enable-multibyte --enable-rubyinterp=yes --enable-python3interp=yes --with-python3-config-dir=/usr/lib/python3.7/config-3.7m-x86_64-linux-gnu --enable-perlinterp=yes --enable-luainterp=yes --enable-gui=gtk2 --enable-cscope --prefix=/usr/local

$make VIMRUNTIMEDIR=/usr/local/share/vim/vim82

$sudo make install




#
# how to install cmake
#
$https://askubuntu.com/questions/355565/how-do-i-install-the-latest-version-of-cmake-from-the-command-line

$python ./install.sh --clang-completer




