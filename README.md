# cheat_copilot.vim
This plugin brings [chubin/cheat.sh: the only cheat sheet you need](https://github.com/chubin/cheat.sh) to your vim workflow.
It can be used as alternative to [GitHub Copilot](https://copilot.github.com/).

## Usage
By calling `cheat_copilot#open(topic)` the *markdown* buffer will be oppened. Inside this buffer you can evaluate any line as qustion for *cheat.sh*.
The `topic` is for this purpose filetype (for now tested with: `php`, `javascript`, `html`, `css`, `sass`).

You can provide proper syntax highliht via native [vim-markdown](https://github.com/tpope/vim-markdown) using:

```vim
    let g:markdown_fenced_languages= [ 'html', 'css', 'sass', 'javascript', 'js=javascript', 'php', 'vim' ]
```

example `command`/mapping:
```vim
    command! -nargs=? Cheat call cheat_copilot#open(<q-args>==''?&filetype:<q-args>)
    nnoremap <f1> :call cheat_copilot#open(&filetype)<cr>
```

screenshot:
![Usage example](./Screenshot_20220401_142008.png)

## Installation
Install using your favorite package manager, or use Vim's built-in package support:

    mkdir -p ~/.vim/bundle/vim-cheat_copilot
    cd ~/.vim/bundle/vim-cheat_copilot
    git clone -b main --single-branch https://github.com/jaandrle/vim-cheat_copilot.git --depth 1

In `.vimrc`:

    set runtimepath^=~/.vim/bundle/*

## Inspiration/alternatives
- [ashzero2/VimPilot: Copilot with extra steps ^-^](https://github.com/ashzero2/VimPilot)
- [dbeniamine/cheat.sh-vim: A vim plugin to access cheat.sh sheets](https://github.com/dbeniamine/cheat.sh-vim)
