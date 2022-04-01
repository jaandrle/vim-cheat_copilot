# cheat_pilot.vim
This plugin brings [chubin/cheat.sh: the only cheat sheet you need](https://github.com/chubin/cheat.sh) to your vim workflow.
It can be used as alternative to [GitHub Copilot](https://copilot.github.com/). Inspired by [ashzero2/VimPilot: Copilot with extra steps ^-^](https://github.com/ashzero2/VimPilot)

## Usage
By calling `cheat_pilot#open(topic)` the *markdown* buffer will be oppened. Inside this buffer you can evaluate any line as qustion for *cheat.sh*.
The `topic` is for this purpose filetype (for now tested with: `php`, `javascript`, `html`, `css`, `sass`).

You can provide proper syntax highliht via native [vim-markdown](https://github.com/tpope/vim-markdown) using:

```vim
    let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
```

suggested `command`:
```vim
    command! -nargs=? Cheat call cheat_pilot#open(<q-args>==''?&filetype:<q-args>)
```

## Installation
Install using your favorite package manager, or use Vim's built-in package support:

    mkdir -p ~/.vim/bundle/vim-cheat_pilot
    cd ~/.vim/bundle/vim-cheat_pilot
    git clone -b main --single-branch https://github.com/jaandrle/vim-cheat_pilot.git --depth 1

In `.vimrc`:

    set runtimepath^=~/.vim/bundle/*

## TODO
- [ ] better README
- [ ] tbd
