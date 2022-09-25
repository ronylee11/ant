call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletion and definition preview
Plug 'preservim/nerdtree' " Nerdtree the file system tree explorer
Plug 'Xuyuanp/nerdtree-git-plugin' " Nerdtree Modified
Plug 'ryanoasis/vim-devicons' " Nerdtree icon
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Nerdtree Syntax Highlight 
Plug 'PhilRunninger/nerdtree-visual-selection' " Nerdtree Move,Delete,Copy,Open
Plug 'voldikss/vim-floaterm' " Floating Terminal
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax Highlight
Plug 'nvim-treesitter/nvim-treesitter-context' " Sticky Header
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'christoomey/vim-tmux-navigator' " Navigate between tree and file
Plug 'preservim/nerdcommenter' " Comment Line
Plug 'ThePrimeagen/vim-be-good' " Vim Exercise Game
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Search word in all docs
Plug 'junegunn/fzf.vim' " Dependencies: the_silver_searcher, bat
Plug 'mattn/emmet-vim' " Emmet
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " Markdown Preview, requires yarn and nodejs
Plug 'github/copilot.vim' " Github Copilot, autosuggest code
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon' " Harpoon, alternate between files easily
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } " Telescope, :Files but with syntax highlighting
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'sbdchd/neoformat'
Plug 'maksimr/vim-jsbeautify'
Plug 'luk400/vim-lichess' " Lichess
" Themes
"Plug 'morhetz/gruvbox'
"Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'cocopon/iceberg.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Themes
"autocmd vimenter * ++nested colorscheme gruvbox
"autocmd vimenter * ++nested colorscheme catppuccin
autocmd vimenter * ++nested colorscheme iceberg
set background=dark    " Setting dark mode
"colorscheme gruvbox " Gruvbox
"colorscheme catppuccin " Catppuccin
"let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha
"colorscheme catppuccin
"let g:airline_theme='onedark' " Airline
"let g:airline_theme='nord_minimal' " Airline
let g:airline_theme='iceberg' " Airline

" Add Number Line at beginning of every line
set number
set relativenumber
" Add clipboard support
set clipboard+=unnamedplus
" Toggle NERDTree
nmap <C-b> :NERDTreeToggle<CR>
" Opening and Closing Floaterm
nmap <A-Esc> :FloatermToggle<CR>
tnoremap <esc><esc> <c-\><c-n>
" Switching Tabs
map <C-Right> :tabn<cr>
map <C-Left> :tabp<cr>
" Commenting and Uncommenting
nmap <C-_> <leader>c<Space>
vmap <C-_> <leader>c<Space>
" Set <tab> space wide
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" Emmet
nnoremap <c-z> <nop>
let g:user_emmet_leader_key='<C-Z>'
" Force saving files that require root permission 
cnoremap w!! w !sudo tee > /dev/null %
" Auto Syntax Highlight .html file
"autocmd BufNewFile,BufRead *.ejs,html set filetype=html
autocmd BufNewFile,BufRead *.html set filetype=html
" Ag Searching Tool
let g:ackprg = 'ag --nogroup --nocolor --column'
"nnoremap <c-p> :Files<CR>
" Telescope
"Search files by file name
nnoremap <c-p> :Telescope find_files<CR> 
"Search files by content
nnoremap <c-n> :lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>
" Harpoon
nnoremap <c-a> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <a-a> :lua require'harpoon.mark'.add_file()<CR>
nnoremap <a-1> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <a-2> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <a-3> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <a-4> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <a-5> :lua require("harpoon.ui").nav_file(5)<CR>


" You might have to force true color when using regular vim inside tmux as the
" colorscheme can appear to be grayscale with "termguicolors" option enabled.
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

syntax on
set termguicolors


" True Color config
"Use 25-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


" NERDTree config
let g:NERDTreeGitStatusWithFlags = 1

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()


" coc config
let g:coc_global_extensions = [
  \ 'coc-eslint', 
  \ 'coc-explorer',
  \ 'coc-floaterm',
  \ 'coc-html',
  \ 'coc-json', 
  \ 'coc-pairs',
  \ 'coc-prettier', 
  \ 'coc-python',
  \ 'coc-sh',
  \ 'coc-snippets',
  \ 'coc-tsserver@1.11.1',
  \ 'coc-yank',
  \ 'coc-rainbow-fart',
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <S-TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<S-TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Formatter
"augroup fmt
  "autocmd!
  "autocmd BufWritePre * undojoin | Neoformat
"augroup END

" Lichess
let g:lichess_api_token = "lip_MAuavbwgOo1hmk4mhvhk"
