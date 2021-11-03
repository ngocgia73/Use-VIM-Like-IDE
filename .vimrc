" use pathogen to manage plugin in vim
set nocompatible
filetype plugin indent on
syntax on

execute pathogen#infect()

" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-z> :NERDTreeToggle<CR>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" show hidden files
let NERDTreeShowHidden=1

"set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath+=~/.vim/bundle/fzf

" status line
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif

set noshowmode
" ===end status line configuration===

" configuration for tagbar
nmap <F10> :TagbarToggle<CR>
nmap <F9> :TagbarOpenAutoClose<CR>
" === end===
" set up scsope
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set csverb
    " C symbol
    nmap <C-x>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    " definition
    nmap <C-x>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    " functions that called by this function
    nmap <C-x>d :cs find d <C-R>=expand("<cword>")<CR><CR>
    " funtions that calling this function
    nmap <C-x>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    " test string
    nmap <C-x>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    " egrep pattern
    nmap <C-x>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    " file
    nmap <C-x>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    " files #including this file
    nmap <C-x>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

    " Automatically make cscope connections
    function! LoadCscope()
        let db = findfile("cscope.out", ".;")
        if (!empty(db))
            let path = strpart(db, 0, match(db, "/cscope.out$"))
            set nocscopeverbose " suppress 'duplicate connection' error
            exe "cs add " . db . " " . path
            set cscopeverbose
        endif
    endfunction
    au BufEnter /* call LoadCscope()

endif
" ===end===

" Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
"
" " Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
"
" " Align line-wise comment delimiters flush left instead of following code
" indentation
" let g:NERDDefaultAlign = 'left'
"
" " Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1
"
" " Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
" " Allow commenting and inverting empty lines (useful when commenting a
" region)
" let g:NERDCommentEmptyLines = 1
"
" " Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1

" highlight words which current cursor is pointing
set hlsearch

" can switch between splitscreen when working with multi file

nmap <F7> :tabprevious<CR>
nmap <F8> :tabNext<CR>

" for seach file"
nmap <C-c> :Files<CR>


" show number line of code
set number

" configure tab space
set tabstop=4
set shiftwidth=4
set expandtab

" setup ctags
set autochdir
set tags=tags;
" cscope
source ~/.vim/bundle/cscope_maps.vim

" vim rainbow
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.c' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" GitGutter
" :GitGutterDisable
" :GitGutterEnable
" :GitGutterToggle


" youcompleteme
" for backup: let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/youcompleteme/third_party/ycmd/examples/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"set runtimepath+=~/.vim/bundle/youcompleteme

"set encoding=utf-8
"let g:ycm_use_clangd = 1


" smart tab
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


" fix wrong strange chracter
let &t_TI = ""
let &t_TE = ""

set backspace=indent,eol,start " backspace over everything in insert mode


" search pattern
"command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)
nmap <C-s> :Rg<CR>

" supertab key
"let g:SuperTabDefaultCompletionType = "<c-n>"
