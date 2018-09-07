# Vim Syntax for SCSS (Sassy CSS)

A more maintained fork of [scss-syntax.vim][scss-syntax.vim].

## Installation

### Using a plugin manager

I recommend [Vim-Plug][vim-plug] but you can use any of the below (or any other manager you like).

If you've never used a plugin manager before, instructions are included in their README files.

#### [Vim-Plug][vim-plug]

Add this to your `.vimrc`

```vim
Plug 'ObserverOfTime/scss.vim', {'for': 'scss'}
```

#### [Dein][dein.vim]

Add this to your `.vimrc`

```vim
call dein#add('ObserverOfTime/scss.vim', {'on_ft': 'scss'})
```

#### [VAM][vim-addon-manager]

Add this to your `.vimrc`

```vim
autocmd BufNewFile,BufRead *.scss
	\ call vam#ActivateAddons(['github:ObserverOfTime/scss.vim'],
	\ {'on_name': '\.scss$', 'force_loading_plugins_now': 1})
```

_*(VAM also has other ways to install plugins)_

#### [Pathogen][vim-pathogen]

Clone the repository to the pathogen bundle directory.

```sh
git clone https://github.com/ObserverOfTime/scss.vim ~/.vim/bundle/scss.vim
```

### Manually

* Download [scss.vim](https://github.com/ObserverOfTime/scss.vim/archive/master.zip)
* Unzip it
* Copy the directory contents to `~/.vim/`

## Caveats

### Older Vim versions

If you're using Vim &lt; 7.4 you will need the [css.vim][css.vim] plugin as well.

### CSS3 highlighting

For highlighting CSS elements, this plugin relies on `css.vim` which comes bundled with Vim.
However, its support for CSS3 is only rudimentary.
For proper highlighting, you can install the [vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax) plugin.

### Function names starting with a keyword

Function names starting with a keyword (e.g. `baseline-unit()`) are not highlighted correctly by default. This can be fixed by adding the following line to your `~/.vimrc` file:

```vim
autocmd FileType scss set iskeyword+=-
```

Please be aware that this setting also affects the behavior of the motion keys.

<!-- Links -->

[scss-syntax.vim]: https://github.com/cakebaker/scss-syntax.vim
[vim-plug]: https://github.com/junegunn/vim-plug
[dein.vim]: https://github.com/Shougo/dein.vim
[vim-addon-manager]: https://github.com/MarcWeber/vim-addon-manager
[vim-pathogen]: https://github.com/tpope/vim-pathogen
[css.vim]: https://github.com/JulesWang/css.vim

