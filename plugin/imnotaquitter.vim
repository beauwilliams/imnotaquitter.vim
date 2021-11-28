if exists('g:loaded_imnotaquitter') | finish | endif
let g:loaded_imnotaquitter = 1 "Don't load twice


"A vim best practise
let s:save_cpo = &cpo
set cpo&vim


function! Randnum(max) abort
  return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:]) % a:max
endfunction


function! Affirmation()
    let index = Randnum(4)
    let affirmations = [
                \"I am not a quitter.",
                \"I can do this. I will never quit vim. End of story.",
                \"I am enough. I am whole. I will never quit vim.",
                \"I don’t sweat the small stuff. Nor do I exit vim.",
                \"I am adventurous. I overcome fears by following my dreams. My dream is to never quit vim."
                \]
    return affirmations[index]
endfunction

function! ImNotAQuitter()
      if (confirm(Affirmation(), "&Okay", 1)!=1)
        return v:false
      endif
endfunction

cnoreabbrev <expr> q (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> q! (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> qu (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> qu! (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> quit (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> quit! (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> qa (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> qa! (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> qall (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> qall! (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> quitall (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> quitall! (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> wq (ImNotAQuitter()) ? '' : 'w'
cnoreabbrev <expr> wq! (ImNotAQuitter()) ? '' : 'w!'
cnoreabbrev <expr> wqa (ImNotAQuitter()) ? '' : 'wa'
cnoreabbrev <expr> wqa! (ImNotAQuitter()) ? '' : 'wa!'
cnoreabbrev <expr> wqall (ImNotAQuitter()) ? '' : 'wa'
cnoreabbrev <expr> wqall! (ImNotAQuitter()) ? '' : 'wa!'
cnoreabbrev <expr> x (ImNotAQuitter()) ? '' : 'w'
cnoreabbrev <expr> exit (ImNotAQuitter()) ? '' : 'w'
cnoreabbrev <expr> xit (ImNotAQuitter()) ? '' : 'w'
cnoreabbrev <expr> x! (ImNotAQuitter()) ? '' : 'w!'
cnoreabbrev <expr> xall! (ImNotAQuitter()) ? '' : 'wa!'
cnoreabbrev <expr> xa! (ImNotAQuitter()) ? '' : 'wa!'
cnoreabbrev <expr> cq (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> :q (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> vim.cmd'q' (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> execute('q') (ImNotAQuitter()) ? '' : ''
map ZZ <cmd> call ImNotAQuitter()<cr> <bar> <cmd>w<cr>
map ZQ <cmd> call ImNotAQuitter()<cr>
command! -bang LETMEOUTOFHERE qall<bang>

augroup Im_Not_A_Quitter
  autocmd!
  autocmd CmdlineEnter : let s:isk_save = &l:iskeyword | setlocal iskeyword+=!
  autocmd CmdlineLeave : let &l:iskeyword = s:isk_save
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
