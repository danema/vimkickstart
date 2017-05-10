# vimkickstart
This project was born from a point where me and my development team got really frustrated about the lack of fast Ruby IDE's. In the search towards a fast and advanced editor we found Vim (with the right configuration) capable of being fast like Sublime Text and provide us with the nice features an IDE provides like Code Completion and GIT support.
This repo should provide you with a nice Kickstart-Vim-Configuration you can build on.

![Alt text](https://cloud.githubusercontent.com/assets/962263/25851310/95990e94-34c5-11e7-859c-9bf6d0983f0c.png "Screenshot")

----
## Quick Start
1. Clone this repo in your home folder which will create **~/vimkickstart**.
```bash
git clone git@github.com:danema/vimkickstart.git
```
2. Create symbolic links to the repo
```bash
if [ -f "$HOME/.vimrc" ]; then mv .vimrc .vimrc.bck && ln -s vimkickstart/.vimrc; else ln -s vimkickstart/.vimrc; fi; if [ -d "$HOME/.vim" ]; then mv .vim vimkickstart/ && ln -s vimkickstart/.vim; else ln -s vimkickstart/.vim; fi
```
3. Install the latest version of Vim
```bash
brew update && brew install vim --with-override-system-vi
```
4. Install Vim Plugins
```bash
vim +PluginInstall +qall
```
5. Install Cmake (Required for Code Completion)
```bash
brew install cmake
```
6. Compile YCM (Required for Code Completion)
```bash
cd ~/.vim/bundle/YouCompleteMe
./install.py
```
7. Install [eclim](http://eclim.org/install.html) to get Code Completion from Eclipse (optional)
