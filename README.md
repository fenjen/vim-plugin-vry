# vry
`vry repeats you`

vry highlights verbatim repetitions of the current selection, yonder in the buffer.

## Preview
![video](vry.gif)

## Installation
Install with your favorite plugin manager.

### Packet Manager: vimplug

Install [vimplug](https://github.com/junegunn/vim-plug) and vry:

Unix
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Windows (Powershell)
```powershell
iwr 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' -OutFile "$HOME/vimfiles/autoload/plug.vim"
```

vimrc:

```vimrc
silent! call plug#begin()
silent! Plug 'fenjen/vim-plugin-vry'
silent! call plug#end()
```

## Author
fenjen

## Fork
This project is a fork of https://github.com/itchyny/vim-cursorword, itchyny (https://github.com/itchyny).

## License
This software is released under the MIT License, see LICENSE.
