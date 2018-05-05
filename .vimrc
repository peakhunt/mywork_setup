set nocp " :-)
" turn these ON:
set digraph ek hidden ruler sc vb wmnu
" turn these OFF:
set noeb noet nosol
" non-toggles:
set bs=2 fo=cqrt ls=2 shm=at tw=72 ww=<,>,h,l
set comments=b:#,:%,fb:-,n:>,n:)
"set list listchars=tab:»·,trail:·
set viminfo=%,'50,\"100,:100,n~/.viminfo

" settings which are the default
" (at least with "nocompatible" anyway):
" set smd sw=8 ts=Z
" mappings:
map K     <NUL>
map <C-Z> :shell
map ,F :view    $VIMRUNTIME/filetype.vim
map ,SO :source $VIMRUNTIME/syntax/
map ,V  :view   $VIMRUNTIME/syntax/
" autocommands:
au FileType mail set tw=70
" some colors:  "white on black"
hi normal   ctermfg=white  ctermbg=black guifg=white  guibg=black
hi nontext  ctermfg=blue   ctermbg=black guifg=blue   guibg=black

" Additional Color Setup
set background=dark
highlight Comment guibg=black    guifg=Red    gui=bold
highlight LineNr  term=NONE
highlight NonText guifg=Gray95   guibg=Black  gui=bold
highlight Normal  guibg=Black    guifg=Gray95
highlight Search  guibg=Cyan     guifg=Black  gui=underline
highlight Visual  guibg=Yellow   guifg=Black  gui=underline

" syntax coloring!! :-)
syn on

" ========================================================================
" Programming in C
" ========================================================================
"
"  Ysbl   insert statement block
ab Ysbl   {<ESC>o}<ESC>O 
"
"  Ydef   insert "#define" at start of line
ab Ydef   <ESC>0i#define
"
"  Yinc   insert "#include" at start of line
ab Yinc   <ESC>0i#include
"
"  Yelse  insert else clause of if statement with following if statement
ab Yelif  else if () {<ESC>o}<ESC>k$2hi
"
"  Yelse  insert else clause of if statement
ab Yelse  else {<ESC>o}<ESC>O   
"
"  Yfor   insert "for" statement
ab Yfor   for (;;) {<ESC>o}<ESC>kwa
"
"  Yif    insert "if" statement
ab Yif    if () {<ESC>o}<ESC>k$2hi
"
"  Ywhile insert "while" statement
ab Ywhile while () do {<ESC>o}<ESC>k$5hi
"
"  Ymain  insert "main" routine
ab Ymain  main (argc,argv) <ESC>oint argc;<ESC>ochar *argv;<ESC>o{<ESC>o}<ESC>O
"
"   <C-A> insert brackets for statement list
map <C-A> o{<ESC>o}<ESC>O                
"

" Insert mode:  Typing an opening curly bracket will insert a pair of
"  curly brackets and move the cursor before the closing curly bracket:
":inoremap { {}<ESC>i

" Insert mode:  Typing a closing curly bracket will jump after the next closing
" curly bracket (this assumes that curly brackets are always inserted as a pair.)
":inoremap  } <ESC>/}/e+2<C-M>i

"remap tab so that it inserts 4 space instead of tab
"map <ctrl-v><ctrl-i> <space><space><space><space>

"set tb=none
set go=ar

" H.Kim's programming style
ab #d #define
ab #i #include
ab #b /*****************************************************************************
ab #e *****************************************************************************/
ab #l /*--------------------------------------------------------------------------*/
map ,i :set ignorecase
map ,I :set noignorecase
map ,t :set expandtab
map ,T :set noexpandtab
map ,F ?^{
map ,f /^}
map ,SC /\/\*.*\*\/
map ,CO I/* <ESC> A */<ESC>
"map ,IO O#if 0<ESC>jo#endif<ESC>

hi StatusLine guibg=green guifg=cadetblue
set vb t_vb="
set shortmess=I

"cvs related vi

" This is for telica
"for telica developers only
set ts=2
set sw=2
set expandtab
set incsearch
set hlsearch
set autoindent
set cindent
"set guifont=Liberation\ Mono\ 10
set guifont=Monospace\ 10

"set foldnestmax=1
"set foldmethod=manual

func! HideAll()
   syn region myFold start="{" end="}" transparent fold
   syn sync fromstart
   set foldnestmax=1
   set foldmethod=syntax
endfunc

"color torte

" auto templates here
au BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl

" template placeholder jump key
nnoremap <c-j> /<+.\{-1,}+><cr>c/+>/e<cr>
inoremap <c-j> <ESC>/<+.\{-1,}+><cr>c/+>/e<cr>

map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
map <F3> :noh<CR>

set textwidth=0 
set wrapmargin=0

set undodir=~/.vim/undodir
set undofile
