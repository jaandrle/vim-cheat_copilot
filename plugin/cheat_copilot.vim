
" #region Guard
if exists('g:load_cheat_copilot')
  finish
endif
let g:load_cheat_copilot = 1

let s:save_cpo = &cpo
set cpo&vim
" #endregion

let g:cheat_copilot#buffer_exec= 'wincmd L | vertical resize 90'

function! s:CurlCheat(path, quick= '')
    return system('curl -fGsS --compressed cht.sh/'.substitute(a:path, ' ', '+', 'g').'?T'.a:quick.' 2> /dev/null')
endfunction
function! s:Topic(topic)
    if a:topic == 'vim' | return 'vimscript' | endif
    if a:topic == 'scss' | return 'sass' | endif
    return a:topic
endfunction
function! s:Append(topic, question, is_quick= 0)
    let quick= a:is_quick ? 'Q' : ''
    echo 'Cheat Copilot: answering "'.a:topic.'/'.a:question.'"…'
    let answer= <sid>CurlCheat(a:topic.'/'.a:question, quick)
    echo 'Cheat Copilot: done'
    let output= answer != '' ? answer : 'Cheat Copilot: Nothing has been found.'
    call append('.', [ '', '```'.a:topic ] + split(output, "\n") + [ '```', '' ])
    silent! redraw
endfunction

function cheat_copilot#open(topic)
    let topic= <sid>Topic(a:topic)
    let command= 'cheat_copilot'
    let winnr_id = bufwinnr('^' . command . '$')
    silent! execute  winnr_id < 0 ? 'botright new ' . fnameescape(command) : winnr_id . 'wincmd w'
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap number filetype=markdown
    silent! execute g:cheat_copilot#buffer_exec
    silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'inoremap <buffer> <f1>   <c-g>u<esc>:call <sid>Append("'.topic.'", getline("."))<cr>'
    silent! execute 'inoremap <buffer> <f2> <c-g>u<esc>:call <sid>Append("'.topic.'", getline("."), 1)<cr>'
    silent! execute 'nnoremap <silent> <buffer> <f1> :q<CR>'
    call append(0, [
        \ '# “Cheat Copilot” for **'.topic.'**',
        \ '- use `<f1>` in INSERT mode for evaluating current line',
        \ '- use `<f2>` in INSERT mode for only snippet answer(s)',
        \ '- use `<f1>` in NORMAL mode for close this buffer',
        \ '',
        \ '## Playground'
    \])
    silent! redraw
    call feedkeys('ccu')
endfunction

" #region Finish
let &cpo = s:save_cpo
unlet s:save_cpo
" #endregion

" vim: set tabstop=4 shiftwidth=4 textwidth=250 expandtab :
" vim>60: set foldmethod=marker foldmarker=#region,#endregion :
