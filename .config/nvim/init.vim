set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

"" Vimrc
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source %
endif

call plug#begin()

" Utilities
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletion and definition preview
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax Highlight
Plug 'nvim-treesitter/nvim-treesitter-context' " Sticky Header
Plug 'preservim/nerdcommenter' " Comment Line
Plug 'christoomey/vim-tmux-navigator' " Navigate between tree and file
Plug 'mattn/emmet-vim' " Emmet
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Multiple cursor
Plug 'thosakwe/vim-flutter' " Flutter Hot Reload
" Good Practices
Plug 'vim-syntastic/syntastic' " C++ Linter
Plug 'mfussenegger/nvim-dap' " C++ Debugger
Plug 'maksimr/vim-jsbeautify' " JS Syntax
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
" Cool stuff
Plug 'voldikss/vim-floaterm' " Floating Terminal
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " Markdown Preview, requires yarn and nodejs
Plug 'github/copilot.vim' " Github Copilot, autosuggest code
Plug 'ThePrimeagen/vim-be-good' " Vim Exercise Game
Plug 'wakatime/vim-wakatime' " Vim Wakatime, records ur coding time
" Navigation
Plug 'ronylee11/startup.nvim' " Startup page
Plug 'ThePrimeagen/harpoon' " Harpoon, alternate between files easily
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } " Telescope, :Files but with syntax highlighting
Plug 'nvim-lua/plenary.nvim' " Dependencies for telescope
Plug 'nvim-telescope/telescope-file-browser.nvim' " Telescope File Browser
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' } " Telescope fzf plugin
Plug 'nvim-telescope/telescope-live-grep-args.nvim' " Telescope live grep args
" Themes
Plug 'cocopon/iceberg.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Themes
"autocmd vimenter * ++nested colorscheme iceberg
set background=dark    " Setting dark mode
colorscheme iceberg " Iceberg
let g:airline_theme='iceberg' " Airline

" Add Number Line at beginning of every line
set number
set relativenumber
" Add clipboard support
set clipboard+=unnamedplus
"Open Floaterm in current directory
nmap <A-Esc> :FloatermToggle<CR> 
tnoremap <esc><esc> <c-\><c-n>
" New Tab
nmap <c-w>t :tabnew<cr> 
" Switching Tabs
map <C-Right> :tabn<cr>
map <C-Left> :tabp<cr>
" Only on GUI(Neovide)
map <C-Tab> gt
map <C-S-Tab> gT
" Commenting and Uncommenting
filetype plugin on
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle
" Set <tab> space wide
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" Enable to switch buffer without saving
set hidden
" set leader key to space
let mapleader = ' '
" Emmet
nnoremap <c-z> <nop>
let g:user_emmet_leader_key='<C-Z>'
" Force saving files that require root permission 
cnoremap w!! w !sudo tee > /dev/null %
" Auto Syntax Highlight .html file
autocmd BufNewFile,BufRead *.html set filetype=html
"autocmd BufNewFile,BufRead *.ejs,html set filetype=html
" Ag Searching Tool
let g:ackprg = 'ag --nogroup --nocolor --column'
" Telescope
"Search files by file name
nnoremap <c-p> :Telescope find_files<CR> 
"Search files by content " By default it seems c-m is also binded to Enter Key
nnoremap <c-m> :lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>
" Harpoon
nnoremap <c-a> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <a-a> :lua require'harpoon.mark'.add_file()<CR>
nnoremap <a-1> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <a-2> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <a-3> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <a-4> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <a-5> :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <a-6> :lua require("harpoon.ui").nav_file(6)<CR>
nnoremap <a-7> :lua require("harpoon.ui").nav_file(7)<CR>
nnoremap <a-8> :lua require("harpoon.ui").nav_file(8)<CR>
nnoremap <a-9> :lua require("harpoon.ui").nav_file(9)<CR>
nnoremap <a-0> :lua require("harpoon.ui").nav_file(0)<CR>
" Netrw
nnoremap <c-b> :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>


" You might have to force true color when using regular vim inside tmux as the
" colorscheme can appear to be grayscale with "termguicolors" option enabled.
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

filetype plugin indent on
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
  \ 'coc-flutter',
  \ 'coc-java',
  \ 'coc-phpls',
  \ '@yaegassy/coc-intelephense',
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
xmap <leader>ar  <Plug>(coc-codeaction-selected)
nmap <leader>ar  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

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

" COC Prettier Formatter
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" COC Intelephense
nmap <silent> ga <Plug>(coc-codeaction-line)
xmap <silent> ga <Plug>(coc-codeaction-selected)
nmap <silent> <leader>aa <Plug>(coc-codeaction-cursor)
nmap <silent> gA <Plug>(coc-codeaction)
" Neovide font
set guifont=Hack\ Nerd\ Font\ Mono:h10

" Netrw config 
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" Hide hidden directories
let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=ghregex
" Unbind default keybind refresh screen Ctrl + L and bind to TmuxNavigateRight
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
  nnoremap <silent> <buffer> <c-l> :TmuxNavigateRight<CR>
endfunction

let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
" The following two lines are optional. Configure it to your liking!
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Multiple-cursor
let g:VM_mouse_mappings = 1"

"Remove the How-to disable mouse menu item and the separator above it
aunmenu PopUp.How-to\ disable\ mouse
aunmenu PopUp.-1-

" Load lua config files
lua require("init")

