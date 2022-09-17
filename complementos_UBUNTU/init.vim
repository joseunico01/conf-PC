"___________________________________________________________________________
"###########################################################################
"NVIM CONFIGURACION GENERAL
"################################# INICIO ##################################
"TODO: CONFIGURATION GENERAL
autocmd BufWritePre * :%s/\s\+$//e
set noswapfile
syntax on
set mouse=a
set noerrorbells
set sw=2 sts=2
set number
set smartindent
set rnu
set numberwidth=1
set nowrap
set nobackup
set showmatch
set incsearch
set ignorecase
set clipboard=unnamedplus
set encoding=UTF-8
set cursorline
set relativenumber
set showcmd
set ruler
set laststatus=2
set noshowmode
set smartcase
set hlsearch
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
filetype plugin indent on
set colorcolumn=80

"cuando hagamos split se acomode abajo o arriba
set splitbelow
set splitright

set foldmethod=syntax
"set foldmethod=indent
set nofoldenable        "dont fold by default

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO: INSTALACION DE PLUGIN
call plug#begin('~/.config/nvim/plugged')

"Themes
Plug 'joshdick/onedark.vim'
Plug 'dikiaap/minimalist'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tomasr/molokai'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'jnurmine/Zenburn'
Plug 'rakr/vim-one'

"Busqueda
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'voldikss/vim-floaterm' "TERMINAL

"Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'dhruvasagar/vim-dotoo'

"Tmux
Plug 'yazgoo/vmux'
Plug 'christoomey/vim-tmux-navigator'   "poder navegar entreeararchivos abiertos

"Autocomplementado
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'docteurklein/php-getter-setter.vim' "getter-setter php
Plug 'dinduks/vim-java-get-set'
"Para invocar getter and setter, primero subrayamos lo q queremos insertar
"Para java // :InsertGetterSetter
"Plug 'aca/completion-tabnine', { 'do': 'version=3.1.9 ./install.sh' }

"TERMINAL
Plug 'erietz/vim-terminator', { 'branch': 'main'} "ejecutar codigo de lenguajes de progra

"Sintax
Plug 'sheerun/vim-polyglot' "resalta de color los lenguajes de progra
"Plug 'jwalton512/vim-blade' "resalta el lenguaje blade
Plug 'majutsushi/tagbar' "Para ver las variables generales de nuestro leng.programacion
Plug 'lilydjwg/colorizer' "Color hexadecimal en css
Plug 'KabbAmine/vCoolor.vim'   "insertar color
Plug 'valloric/matchtagalways'
Plug 'sbdchd/neoformat'  "prettier javascript

"IDE
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'  "buscar una palabra en nuestra pagina actual <leader>u +(letra)
Plug 'Yggdroot/indentLine'              "indentacion
Plug 'scrooloose/nerdcommenter' "comentarios
Plug 'jiangmiao/auto-pairs'             "autocompletado de llaves, corchetes, etc
Plug 'osyo-manga/vim-over' "OverCommandLine%s/ ENTER palabra/
Plug 'tpope/vim-surround'  "Para envolver una palabra en un signo, corchete, parentesis
"Para poder envolver una palabra /// ysiw + signo
"Para cambiar de signo 'hello world' a un <p>hello world</p> /// digitamos cs'<q>
"Para eliminar un delimitador digitamos ds' /// 'hello' -> hello
"Para dar iconos a nuestros nvim
"Para reemplazar alguna palabra,  :%s/palbra antigua/palabra nueva
Plug 'tmhedberg/simpylfold' "plegado de codigo
Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/TaskList.vim'
"todoshow para vim, todo,fixme en mayuscula
"funciona con <leader> t  #salir q, mantener ventana y volver a pantalla e

"CONFIGURACION FLUTTER
Plug 'dart-lang/dart-vim-plugin' "da resaltado a sintaxis de dart
"Plug 'natebosch/vim-lsc'
"Plug 'natebosch/vim-lsc-dart'
Plug 'thosakwe/vim-flutter'

"GIT
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO: INSTRUCCIONES EXTRAS
"ESTA CONFIGURACION ES FINAL
"INSTALAR PYTON EN NEOVIM
"sudo apt install python3-pip
"pip3 install --upgrade pynvim

"No te olvides de guardar en .conf/nvim/init.vim
"#solo instalar el primero copiar '+y   pegar  "+p
"sudo apt install xclip

"INSTALAR LIVE SERVER EN NEOVIM
"npm i -g live-server
"Commands LIVE SERVER EN TERMINAL
"live-server some-file.html

"TERMINAL SALIR DE MODO ESCRITURA DEL
"ctrl + \ + ctrl + n

"BUSQUEDA PARA DIFERENCIAR MAYUSCULAS DE MINUSCULA, no lo actives
"set ignorecase smartcase

"BUSCAR 2 PALABRA DIFERENTES EN UNA SOLA BUSQUEDA
"/hello\|hola
"/\vhello|hola

"MOVERSE ENTRE PALABRAS
",,w       /// para moverse hacia delante
",,b       /// para moverse hacia delante

"PLEGADO DE LINEAS
"Como plegar          z+a    ///Sirve para plegar y desplegar
"z+o         ///abrir un pliege
"z+shift+r   ///Para abrir todos los pliegues
"z+c         ///Para cerrar un pliegue
"z+m /// z+shift+m ///para cerrar los pliegues

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO: CONFIOGURACIONES THEMES
"colorscheme onedark

" Gruvbox por defecto
"colorscheme gruvbox
"let g:gruvbox_material_transparent_background = 1
"let g:gruvbox_contrast_dark='hard'
"set background=dark

"DRACULA THEME
"colorscheme dracula

"MOLOKAI THEME
"let g:molokai_original = 1
"let g:rehash256 = 1
"colorscheme molokai

"ONEHALFLIGHT THEME
"THEME HTML
syntax on
set t_Co=256
set cursorline
"colorscheme onehalflight
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
" COMENTARIOS DE ONEHALFLIGHT
" lightline
" let g:lightline = { 'colorscheme': 'onehalfdark' }

"ZERBRUN THEME
"THEME OSCURO MAS CLARO SI ME CANSE DEL THEME OSCURO
"colorscheme zenburn

"VIM-ONE THEME
"THEME ATOM
"if (empty($TMUX))
  "if (has("nvim"))
    ""For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    "let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  "endif
  "if (has("termguicolors"))
    "set termguicolors
  "endif
"endif
"let g:airline_theme='one'
"colorscheme one
"set background=dark   "theme dark
"let g:one_allow_italics = 1 " I love italic for comments
"set background=light "theme light



"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO: CONFIOGURACIONES MAPLEADER
let mapleader=","

"split resize
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

"Colocar ; al final
nnoremap <Leader>; $a;<Esc>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

noremap <Leader>k :bnext<CR>
"<silent>solo funciona cuando estas dentro de vim

nmap <space>e <Cmd>CocCommand explorer<CR>
"FZF
map <Leader>p :Files<CR>
map <Leader>l :Lines<CR>
map <Leader>ll :BLines<CR>
map <Leader>m :Marks<CR>
map <Leader>b :Buffers<cr>
map <Leader>bb :Windows<cr>

"map <Leader>ag :Ag<CR>

"termninal emulation
vnoremap <c-t> :split<CR>:ter<CR>:resize 10<CR>
nnoremap <c-t> :split<CR>:ter<CR>:resize 10<CR>

"Diagnost-mostar la ubicacion de donde nos encontramos
nnoremap <leader>kp :let @*=expand("%")<CR>

"NO USAREMOS LEADER + t, por q tenemos todoshow usa ese comando
"nnoremap <Leader>t :tabnew <insert>

"siguiente buffers y anterior buffer
nnoremap <Leader>k :bnext<CR>
nnoremap <Leader>j :bprevious<CR>
nnoremap <Leader>x :bdelete<CR>
nnoremap <Leader>y "+y<CR>

"Split
nnoremap <Leader>v :vsp<CR>
nnoremap <Leader>s :sp<CR>

"Para q las feclas no funcionen
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

"Ajustar el tamano de las ventanas
nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up> :resize +5<CR>
nnoremap <silent> <down> :resize -5<CR>
nnoremap <Leader>e :e ~/.config/nvim/init.vim<CR>
nmap <F5> :source ~/.config/nvim/init.vim<CR>
vmap <F5> :source ~/.config/nvim/init.vim<CR>


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO: CONFIGURAR HTML IDENTACION
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"Link - https://vi.stackexchange.com/questions/2306/html-syntax-folding-in-vim#comment13471_2333
"syntax region htmlFold start="<\z(\<\(area\|base\|br\|col\|command\|embed\|hr\|img\|input\|keygen\|link\|meta\|para\|source\|track\|wbr\>\)\@![a-z-]\+\>\)\%(\_s*\_[^/]\?>\|\_s\_[^>]*\_[^>/]>\)" end="</\z1\_s*>" fold transparent keepend extend containedin=htmlHead,htmlH\d
"VIM
"~/.vim/after/ftplugin/html.vim
"NEOVIM
"~/.config/nvim/after/syntax/html.vim

"Eliminar los comentarios de un archivo
nnoremap <Leader>d :g/^\s*#/d<CR>

"Buscamos con 2 letras un palabra en nuestro archivo
nmap <Leader>u <Plug>(easymotion-s2)

"Ejecutar un archivo javascrip/node
"nnoremap <Leader>x :!node %<cr>


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO: VIM AIRLINE
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='google_dark'
"let g:airline_statusline_ontop=0
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 79,
    \ 'x': 60,
    \ 'y': 88,
    \ 'z': 45,
    \ 'warning': 80,
    \ 'error': 80,
    \ }

let g:airline#extensions#default#layout = [
    \ [ 'a', 'b' , 'c', 'x' ],
    \ [ 'z', 'error' ]
    \ ]


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO: COC NVIM
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
":Prettier    "usaremos para formatear el buffer actual
set nobackup
set nowritebackup
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

"Con enter completar
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO: COC SNIPETS
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Use <C-l> for trigger snippet expand.
imap <c-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO: TAGBAR
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"Tambien se nesecita instalar sudo apt install exuberant-ctags
let g:Tlist_Ctags_Cmd='/usr/bin/etags'
":TagbarOpen f    para ver mas completo
nmap <F8> :TagbarToggle<CR>


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO: VIM-TERMINAL
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:terminator_runfile_map = {
            \ "javascript": "node",
            \ "python": "python3 -u",
            \ "c": "gcc $dir$fileName -o $dir$fileNameWithoutExt && $dir$fileNameWithoutExt",
            \ "fortran": "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt"
            \ }

"<leader>rf	  ///Ejecuta su archivo actual
"<leader>or   ///Abre una respuesta
"<leader>ot   ///Abre (o reabre) una ventana de terminal
"<leader>rt   ///Ejecuta su archivo actual (o selección visual) en la terminal
"<leader>rs   ///Detiene el trabajo en ejecución en el búfer de salida
"<leader>rm	  ///Modifica el comando a través de la línea de comando antes de ejecutarlo en el búfer de salida


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO:  TELESCOPE
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files <cr>
nnoremap <leader>fg <cmd>Telescope live_grep prompt_prefix=🔍<cr>
"Para q funciones instalar
"sudo apt  install ripgrep
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"GIT TELESCOPE
nnoremap <leader>gs <cmd>Telescope git_status<cr>
nnoremap <leader>gss <cmd>Telescope git_stash<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>gcc <cmd>Telescope git_bcommits<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>

"Opciones extras
nnoremap <leader>ft <cmd>Telescope colorscheme <cr>
nnoremap <leader>fc <cmd>Telescope command_history<cr>
nnoremap <leader>fm <cmd>Telescope marks<cr>
nnoremap <leader>fk <cmd>Telescope keymaps<cr>


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO:FLUTTER, activar solo cuando usemos
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"nnoremap <leader>fa :FlutterRun<cr>
"nnoremap <leader>fq :FlutterQuit<cr>
"nnoremap <leader>fr :FlutterHotReload<cr>
"nnoremap <leader>fR :FlutterHotRestart<cr>
"nnoremap <leader>fs :FlutterSplit<cr>
"nnoremap <leader>fe :FlutterEmulators<cr>
"Ejecutar Flutter con ConNvim
":CocCommand flutter.run

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO:GETTER SETTER- PHP
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        let g:phpgetset_getterTemplate =
    \ "    \n" .
    \ "    /*" .
    \ "      Get %varname%" .
    \ "     */\n" .
    \ "    public function %funcname%()\n" .
    \ "    {\n" .
    \ "        return $this->%varname%;\n" .
    \ "    }"

        let g:phpgetset_setterTemplate =
  \ "    \n" .
  \ "    /*" .
  \ "      Set %varname%" .
  \ "     */\n" .
  \ "    public function %funcname%($%varname%)\n" .
  \ "    {\n" .
  \ "        $this->%varname% = $%varname%;\n" .
  \ "    }"

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO:GETTER SETTER- JAVA
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  let b:javagetset_getterTemplate =
    \ "\n" .
    \ "/*  Get %varname% */\n" .
    \ "%modifiers% %type% %funcname%() {\n" .
    \ "    return %varname%;\n" .
    \ "}"

  let b:javagetset_setterTemplate =
  \ "\n" .
  \ "/*  Set %varname% */\n" .
  \ "%modifiers% void %funcname%(%type% %varname%) {\n" .
  \ "    this.%varname% = %varname%;\n" .
  \ "}"

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO:DJHTML-DJANGO
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
nmap <silent> ga <Plug>(coc-codeaction-line)
let g:syntastic_python_checkers = ['pylint', 'djhtml', 'djangohtml', 'python']


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO: CTRLP.VIM
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_working_path_mode = 'ra'


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO: FLOATERM TERMINAL
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
let g:floaterm_keymap_toggle = '<F1>'


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO: COC EXPLORER
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
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
"nnoremap <silent> <F9> :CocCommand explorer --preset floating<CR>
nnoremap <silent> <F2> :CocCommand explorer<CR>


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO: TABNINE
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
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

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO: GIT GUTTER
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"muestra la modificacion al costado si hubo en git
"terminal digitar:
"sudo nvim -u NONE -c "helptags vim-gitgutter/doc" -c q
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
let g:gitgutter_max_signs = 500  " default value (Vim < 8.1.0614, Neovim < 0.4.0)
let g:gitgutter_max_signs = -1   " default value (otherwise)


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO: COMMENTS
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:dotoo#agenda#files=['~Documents/dotoo-files/*.dotoo']
let g:dotoo#capture#refile=expand('~Documents/dotoo-files/refile.dotoo')


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO: VCOLOR
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"<Alt-C>      #abrir en modo normal e insertar, hexagesimal
"<Alt-R>      #color rgb
"<Alt-V>      #color hsl
"<Alt-W>      #color rgba


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO: VIM-FUIGITIVE
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"terminal digitar:
"sudo nvim -u NONE -c "helptags fugitive/doc" -c q
"git status    #:G
"git add       #a
"para agregar o desagregar a, u#desagregar, s#agregar
"git commit    #cc
"git push      #:G push


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"TODO: JS format neoformat, formateador de js, ts, react
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"link: https://hashrocket.com/blog/posts/writing-prettier-javascript-in-vim
let g:neoformat_try_formatprg = 1
augroup NeoformatAutoFormat
    autocmd!
    autocmd FileType javascript,typescript,javascript.jsx setlocal formatprg=prettier\
                                                            \--stdin\
                                                            \--print-width\ 80\
                                                            \--single-quote\
                                                            \--trailing-comma\ es5
    autocmd BufWritePre *.ts,*.js,*.jsx Neoformat
augroup END

"############################################################## FIN ########
