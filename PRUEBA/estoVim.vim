"#######################################
"CONF COC EXPLORER
"#######################################
function! s:explorer_cur_dir()
  let node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
  return fnamemodify(node_info['fullpath'], ':h')
endfunction

function! s:exec_cur_dir(cmd)
  let dir = s:explorer_cur_dir()
  execute 'cd ' . dir
  execute a:cmd
endfunction

function! s:init_explorer()
  set winblend=10

  " Integration with other plugins

  " CocList
  nmap <buffer> <Leader>fg <Cmd>call <SID>exec_cur_dir('CocList -I grep')<CR>
  nmap <buffer> <Leader>fG <Cmd>call <SID>exec_cur_dir('CocList -I grep -regex')<CR>
  nmap <buffer> <C-p> <Cmd>call <SID>exec_cur_dir('CocList files')<CR>

  " vim-floaterm
  nmap <buffer> <Leader>ft <Cmd>call <SID>exec_cur_dir('FloatermNew --wintype=floating')<CR>
endfunction

function! s:enter_explorer()
  if &filetype == 'coc-explorer'
    " statusline
    setl statusline=coc-explorer
  endif
endfunction

augroup CocExplorerCustom
  autocmd!
  autocmd BufEnter * call <SID>enter_explorer()
  autocmd FileType coc-explorer call <SID>init_explorer()
augroup END


"nnoremap <leader>n :CocCommand explorer<CR>
nnoremap <silent> <F12> :CocCommand explorer --preset floating<CR>

nnoremap <silent> <F2> :CocCommand explorer<CR>

"TABNINE
" vimrc
let g:completion_chain_complete_list = {
    \ 'default': [
    \    {'complete_items': ['lsp', 'snippet', 'tabnine' ]},
    \    {'mode': '<c-p>'},
    \    {'mode': '<c-n>'}
    \]
\}
" tabnine priority (default: 0)
" Defaults to lowest priority
let g:completion_tabnine_priority = 0

" tabnine binary path (default: expand("<sfile>:p:h:h") .. "/binaries/TabNine_Linux")
let g:completion_tabnine_tabnine_path = ""

" max tabnine completion options(default: 7)
let g:completion_tabnine_max_num_results=7

" sort by tabnine score (default: 0)
let g:completion_tabnine_sort_by_details=1

" max line for tabnine input(default: 1000)
" from current line -1000 ~ +1000 lines is passed as input
let g:completion_tabnine_max_lines=1000

