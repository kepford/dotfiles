" Insert a footnote.
function! s:MdFootnote(note)
  let s:footnote = "[^".a:note."]"
  let @m = s:footnote
  norm "mpmm
  $put = s:footnote.':'
  norm `m
endfunction

command! -nargs=1 Footnote call s:MdFootnote("<args>")
