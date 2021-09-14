if exists('g:loaded_iamnotaquitter') | finish | endif
let g:loaded_iamnotaquitter = 1 "Don't load twice


"A vim best practise
let s:save_cpo = &cpo
set cpo&vim


function! s:randnum(max) abort
  return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:]) % a:max
endfunction


function! Affirmation()
    let index = randnum(4)
    let affirmations = [
                \"I am not a quitter.",
                \"I can do this. I will never quit vim. End of story.",
                \"I am enough. I am whole. I will never quit vim.",
                \"I don’t sweat the small stuff. Nor do I exit vim.",
                \"I am adventurous. I overcome fears by following my dreams. My dream is to never quit vim."
                \]
    return affirmations[index]
endfunction

function! IAmNotAQuitter()
      if (confirm(Affirmation(), "&Okay", 1)!=1)
        return v:false
      endif
endfunction

cnoreabbrev <expr> q (IAmNotAQuitter()) ? '' : ''
cnoreabbrev <expr> q! (IAmNotAQuitter()) ? '' : ''
cnoreabbrev <expr> quit (IAmNotAQuitter()) ? '' : ''
cnoreabbrev <expr> quit! (IAmNotAQuitter()) ? '' : ''
cnoreabbrev <expr> qa (IAmNotAQuitter()) ? '' : ''
cnoreabbrev <expr> qa! (IAmNotAQuitter()) ? '' : ''
cnoreabbrev <expr> qall (IAmNotAQuitter()) ? '' : ''
cnoreabbrev <expr> qall! (IAmNotAQuitter()) ? '' : ''
cnoreabbrev <expr> quitall (IAmNotAQuitter()) ? '' : ''
cnoreabbrev <expr> quitall! (IAmNotAQuitter()) ? '' : ''
cnoreabbrev <expr> wq (IAmNotAQuitter()) ? '' : 'w'
cnoreabbrev <expr> wq! (IAmNotAQuitter()) ? '' : 'w!'
cnoreabbrev <expr> wqa (IAmNotAQuitter()) ? '' : 'wa'
cnoreabbrev <expr> wqa! (IAmNotAQuitter()) ? '' : 'wa!'
cnoreabbrev <expr> wqall (IAmNotAQuitter()) ? '' : 'wa'
cnoreabbrev <expr> wqall! (IAmNotAQuitter()) ? '' : 'wa!'
cnoreabbrev <expr> x (IAmNotAQuitter()) ? '' : 'w'
map ZZ <cmd> call IAmNotAQuitter()<cr> <bar> <cmd>w<cr>
command! -bang LETMEOUTOFHERE qall<bang>

augroup I_Am_Not_A_Quitter
  autocmd!
  autocmd CmdlineEnter : let s:isk_save = &l:iskeyword | setlocal iskeyword+=!
  autocmd CmdlineLeave : let &l:iskeyword = s:isk_save
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
