"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"																		  "
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗					  "
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝					  "
"               ██║   ██║██║██╔████╔██║██████╔╝██║                        "
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║                        "
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗					  "
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝                   "
"           															  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" =========================================================================
" COMPATIBILIDADE E BASE
" =========================================================================
set nocompatible                  " Desativa o modo compatível com Vi
syntax on                         " Habilita destaque de sintaxe
filetype plugin indent on          " Habilita plugins e indentação por tipo de arquivo
set encoding=utf-8                 " Codificação UTF-8
set showcmd                        " Mostra comandos parcialmente digitados
set termguicolors                  " Permite cores 24-bit (necessário para temas modernos)
set background=dark                " Usa temas escuros
set number                         " Mostra números de linha
" set relativenumber               " (Opcional) Números relativos de linha
set cursorline                     " Destaca a linha atual
set showmatch                      " Destaca parênteses correspondentes
set nowrap                         " Não quebra linhas automaticamente

" =========================================================================
" TABS E ESPAÇOS
" =========================================================================
set tabstop=4                      " Tamanho da tabulação em espaços
set shiftwidth=4                   " Número de espaços na indentação
set noexpandtab                    " Usa tabs reais (obrigatório na 42)
set smartindent                    " Indentação inteligente
set backspace=indent,eol,start     " Backspace funciona corretamente

" =========================================================================
" BUSCA
" =========================================================================
set hlsearch                       " Destaca resultados da busca
set incsearch                      " Busca incremental
set ignorecase                     "Ignora maiúsculas/minúsculas
set smartcase                      " Considera maiúsculas se existirem na busca

" =========================================================================
" HISTÓRICO E COMPLETAMENTO
" =========================================================================
set history=1000                   " Guarda 1000 comandos
set wildmenu                       " Menu visual para autocompletar comandos
set wildmode=list:longest:full,full          " Modo de exibição do wildmenu

" =========================================================================
" CLIPBOARD
" =========================================================================
set clipboard=unnamedplus          " Copiar/colar com o sistema

" =========================================================================
" PLUGINS (usando vim-plug)
" =========================================================================
call plug#begin('~/.vim/plugged')

  " ---- Aparência ----
  Plug 'morhetz/gruvbox'                " Tema Gruvbox
  Plug 'vim-airline/vim-airline'        " Barra de status moderna
  Plug 'vim-airline/vim-airline-themes' " Temas para Airline
  Plug 'lilydjwg/colorizer'             " Mostra cores (#RRGGBB)

  " ---- Navegação ----
  Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }  " Árvore de arquivos (lazy load)

  " ---- Edição ----
  Plug 'tpope/vim-commentary'           " Comentar/descomentar linhas
  Plug 'tpope/vim-surround'             " Manipular pares (aspas, colchetes, etc)
  Plug 'jiangmiao/auto-pairs'           " Fecha automaticamente parênteses e aspas

  " ---- Snippets ----
  Plug 'SirVer/ultisnips'               " Sistema de snippets
  Plug 'honza/vim-snippets'             " Pacote com snippets prontos

  " ---- Interface inicial ----
  Plug 'mhinz/vim-startify'   	" Tela inicial
"  Plug 'glepnir/dashboard-nvim', { 'on': 'Dashboard' }  " Dashboard alternativo

  " ---- 42 ----
  Plug '42Paris/42header'               " Cabeçalho da 42 automático

  " ---- Linting (opcional: pode deixar o Vim mais pesado) ----
  Plug 'dense-analysis/ale', { 'for': ['c', 'cpp'] } " Linter C/C++

call plug#end()

" =========================================================================
" CONFIGURAÇÃO DE TEMA E INTERFACE
" =========================================================================
let g:gruvbox_contrast_dark='hard'      " Contraste forte
colorscheme habamax                     " Ativa Gruvbox
set background=dark
let g:airline_theme='gruvbox'           " Tema do Airline
let g:airline_powerline_fonts=1         " Usa fontes Powerline

" =========================================================================
" ALE (Linting para C/C++)
" =========================================================================
let g:ale_linters = {
\   'c': ['cc', 'gcc', 'clang'],
\   'cpp': ['g++', 'clang++'],
\}
let g:ale_fixers = {
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\}
let g:ale_fix_on_save = 1               " Corrige automaticamente ao salvar
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1      " Linta só ao sair do modo inserção

" =========================================================================
" NERDTREE
" =========================================================================
nnoremap <F3> :NERDTreeToggle<CR>       " F3 abre/fecha o NERDTree
" autocmd VimEnter * if !argc() | NERDTree | endif

" =========================================================================
" ULtISNIPS (Snippets)
" =========================================================================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" =========================================================================
" ATALHOS ÚTEIS
" =========================================================================
let mapleader="\<Space>"                " Define tecla líder (espaço)

nnoremap <leader>w :w<CR>               " Salvar
nnoremap <leader>q :q<CR>               " Sair
nnoremap <leader>x :x<CR>               " Salvar e sair
nnoremap <leader>c :bd<CR>              " Fechar buffer
inoremap jj <Esc>                       " 'jj' sai do modo insert
nnoremap <leader>n :set number!<CR> 	" mostra/esconde numeros

" Mostrar tabs e espaços
set listchars=tab:>-,trail:·,extends:>,precedes:<,space:·
nnoremap <leader>l :set list!<CR>       " Alterna visualização de espaços/tabs

" =========================================================================
" DOBRAS (FOLDING)
" =========================================================================
set foldmethod=indent
set foldlevel=99                        " Começa com tudo expandido
nnoremap <leader>z za                   " Espaço+z alterna dobra
augroup remember_folds
  autocmd!
  " Só salvar e carregar folds em buffers normais
  autocmd BufWinLeave * if &buftype == '' && &filetype != 'startify' | mkview | endif
  autocmd BufWinEnter * if &buftype == '' && &filetype != 'startify' | silent! loadview | endif
augroup END

" =========================================================================
" INFORMAÇÕES 42
" =========================================================================
let g:user42 = 'student'
let g:mail42 = 'student@student.42city.com'

" =========================================================================
" STARTIFY (Tela inicial)
" =========================================================================
let g:startify_disable_at_vimenter = 0
let g:startify_files_number = 10
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1

