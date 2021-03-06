"                                                                                                 "
"                 __                                                                              "
"  ____      ___ \ \ \___       __      __        ___    __  __ /\_\     ___ ___    _ __   ___    "
" /\_ ,`\   /'___\\ \  _ `\   /'__`\  /'__`\    /' _ `\ /\ \/\ \\/\ \  /' __` __`\ /\`'__\/'___\  "
" \/_/  /_ /\ \__/ \ \ \ \ \ /\  __/ /\  __/    /\ \/\ \\ \ \_/ |\ \ \ /\ \/\ \/\ \\ \ \//\ \__/  "
"   /\____\\ \____\ \ \_\ \_\\ \____\\ \____\   \ \_\ \_\\ \___/  \ \_\\ \_\ \_\ \_\\ \_\\ \____\ "
"                                                                                                 "
"                                                                                                 "
" -------------------------------------------------------------------------------------------------
" Environment Variables:

filetype plugin indent off

let s:gopath         = expand('$HOME/go')
let s:gopath_src     = s:gopath . '/src/'
let s:srcpath        = expand('$HOME/src')
let s:srcpath_github = s:srcpath . '/github.com/'

" -------------------------------------------------------------------------------------------------
" GlobalAutoCmd:

augroup GlobalAutoCmd
  autocmd!
augroup END
command! -nargs=* Gautocmd   autocmd GlobalAutoCmd <args>
command! -nargs=* Gautocmdft autocmd GlobalAutoCmd FileType <args>

" -------------------------------------------------------------------------------------------------
" Global Settings:

set autoindent
set autoread
set backup
set backupdir=$XDG_DATA_HOME/nvim/backup
set belloff=all
set cinkeys-=0#             " comments don't fiddle with indenting
set cinoptions+=:0,g0,N-1,m1
" set cinoptions=''                 " See :h cinoptions-values
set clipboard+=unnamedplus
set cmdheight=2
set cmdwinheight=50
set complete=.,w,b,u,t  " default: .,w,b,u,t, .
set completeopt=noinsert,noselect,longest
set concealcursor=niv
set conceallevel=0
set copyindent
set cpoptions-=_
set cscopetag
set diffopt+=hiddenoff
set directory=$XDG_DATA_HOME/nvim/swap
set emoji
set encoding=utf-8
set expandtab
set fileformats=unix,mac,dos
" set fillchars="diff:⣿,fold: ,vert:│"  " ,msgsep:‾
" set fillchars=vert:│,fold:·
set foldcolumn=0
set foldlevel=0
set foldlevelstart=99  "open all folds by default
set foldmethod=manual
set foldnestmax=1     " maximum fold depth
set formatoptions+=c  " Autowrap comments using textwidth - :help fo-table
set formatoptions+=j  " Delete comment character when joining commented lines
set formatoptions+=l  " do not wrap lines that have been longer when starting insert mode already
set formatoptions+=n  " Recognize numbered lists
set formatoptions+=q  " Allow formatting of comments with "gq"
set formatoptions+=r  " Insert comment leader after hitting <Enter>
set formatoptions+=t  " Auto-wrap text using textwidth
set formatoptions-=o  " Automatically insert the current comment leader after hitting 'o' or'O' in Normal mode
set grepformat=%f:%l:%c:%m
set grepprg=rg\ -H\ --no-heading\ --smart-case\ --vimgrep
set helplang=en,ja  " Hey, if true Vim master, use English help language.
set hidden
set history=10000
set ignorecase
set iminsert=0
set imsearch=0
set inccommand=nosplit
set langmenu=none
set laststatus=2
set nolazyredraw
set linebreak
set nolist
" set listchars=tab:>,trail:-,nbsp:+
" set listchars=nbsp:%,extends:›,precedes:‹ " tab:»-,trail:_
set makeprg=make
set matchtime=0  " disable nvim matchparen
set maxmempattern=2000000  " default: 1000, max: 2000000
set modeline
set modelines=5
set mouse=a
set number
set packpath=
set path+=$PWD/**,**
set previewheight=5
set pumblend=25
set pumheight=30
set pyxversion=3
set redrawtime=400
set regexpengine=2
set ruler
set scrollback=100000
set scrolljump=5
set scrolloff=8  " default: 0
set secure
set shiftround
set shiftwidth=2
set shortmess+=cI  " atOIc " default: filnxtToOF
set showfulltag
set showtabline=2
set sidescroll=1  " 0
set sidescrolloff=15  " 0
set signcolumn=yes:2
set smartcase
set smartindent
set smarttab
set softtabstop=2
set splitbelow
set splitright
set suffixes+=.pyc
set switchbuf=uselast  " useopen
set synmaxcol=0  " default: 3000, 0: unlimited, 400, 1500, 5000
set tabstop=2
set tagcase=smart
set tags=./tags;  " http://d.hatena.ne.jp/thinca/20090723/1248286959
set termguicolors
set textwidth=0
set title
set titlestring=%{getpid().':'.getcwd()}
set timeout         " mappnig timeout
set timeoutlen=500  " default: 1000
set ttimeout        " keycode timeout
set ttimeoutlen=20  " default: 50
set undodir=~/.local/share/nvim/undo
set undofile
set undolevels=100000
set updatetime=100  " default: 4000
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png            " image
set wildignore+=*.o,*.obj,*.exe,*.dll,*.so,*.out,*.class  " compiler
set wildignore+=*.swp,*.swo,*.swn                         " vim
set wildignore+=*/.git,*/.hg,*/.svn                       " vcs
set wildignore+=tags,*.tags                               " tags
set wildmenu
set wildmode=longest,full
set wildoptions=pum
set pumblend=20
set pumheight=20
set wrap
set writebackup

set noswapfile
set noautochdir
set nocursorcolumn
set nocursorline
set noerrorbells
set nofoldenable
set noimdisable
set nojoinspaces
set noshiftround
set noshowcmd
set noshowmatch
set noshowmode
set nospell
set noswapfile
set novisualbell
set nowrapscan

" set complete+=kspell


if !isdirectory(&backupdir)
  call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
  call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
  call mkdir(&undodir, "p")
endif

if has('mac')
  set wildignore+=*.DS_Store  " macOS only

  function! s:add_macos_headers()
    let s:clt_dir        = '/Library/Developer/CommandLineTools'
    let s:sdk_dir        = s:clt_dir . '/SDKs/MacOSX.sdk'
    let s:macos_paths =
          \ expand($HOME) . '/.local/include'
          \ . ',/usr/local/include'
          \ . ',' . s:sdk_dir . '/usr/include'
          \ . ',' . s:clt_dir . '/usr/lib/clang/11.0.0/include'
          \ . ',' . s:clt_dir . '/usr/include/c++/v1'  " /Library/Developer/CommandLineTools/usr/include/c++/v1

    if isdirectory(expand($XDG_CONFIG_HOME).'/nvim/path/Frameworks/Xcode-beta')
      let s:macos_paths = s:macos_paths . ',' . expand($XDG_CONFIG_HOME) . '/nvim/path/Frameworks/Xcode-beta'
    elseif isdirectory(expand($XDG_CONFIG_HOME).'/nvim/path/Frameworks/Xcode')
      let s:macos_paths = s:macos_paths . ',' . expand($XDG_CONFIG_HOME) . '/nvim/path/Frameworks/Xcode'
    endif

    execute 'set path+=' . s:macos_paths
  endfunction
  Gautocmdft c,cpp,objc,objcpp,go call s:add_macos_headers()  " only Go and C family filetypes
endif

if isdirectory('/usr/local/opt/python3/Frameworks/Python.framework/Versions/3.7/Headers')
  set path+=/usr/local/opt/python3/Frameworks/Python.framework/Versions/3.7/Headers
endif

" add $CPATH directories to &path
for s:cpath in split($CPATH, ":")
  exec 'set path+=' . s:cpath
endfor

" -------------------------------------------------------------------------------------------------
" Dein:

let s:dein_cache_dir = $XDG_CACHE_HOME . '/nvim/dein'
if !isdirectory(s:dein_cache_dir)
  call mkdir(s:dein_cache_dir, 'p')
endif

" let g:dein#auto_recache = 1
let g:dein#cache_directory = s:dein_cache_dir
let g:dein#install_max_processes = 16
let g:dein#types#git#default_protocol = 'https'
let g:dein#types#git#clone_depth = 1
let g:dein#install_progress_type = 'echo'

let s:dein_dir = finddir('dein.vim', '.;')
if s:dein_dir != '' || &runtimepath !~ '/dein.vim'
  if s:dein_dir == '' && &runtimepath !~ '/dein.vim'
    let s:dein_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif

" packadd! termdebug

if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir, [ expand('<sfile>') ])

  " Develop Plugins:
  call dein#local(s:gopath_src, { 'frozen': 1, 'merged': 0 }, ['github.com/zchee/nvim-go'])
  call dein#local(s:gopath_src, { 'frozen': 1, 'merged': 0 }, ['github.com/zchee/nvim-lsp'])
  call dein#local(s:srcpath_github, { 'on_ft': ['fbs'], 'frozen': 1, 'merged': 0 }, ['zchee/vim-flatbuffers'])
  call dein#local(s:srcpath_github, { 'on_ft': ['gn'], 'frozen': 1, 'merged': 0 }, ['zchee/vim-gn'])
  call dein#local(s:srcpath_github, { 'frozen': 1, 'merged': 0 }, ['zchee/vim-goasm'])

  " Dein:
  call dein#add('Shougo/dein.vim')

  " Deoplete:
  call dein#add('Shougo/deoplete.nvim')
  " call dein#local(s:srcpath_github, { 'frozen': 1, 'merged': 0 }, ['Shougo/deoplete.nvim'])
  "" suorces
  call dein#local(s:srcpath_github, { 'frozen': 1, 'merged': 0 }, ['deoplete-plugins/deoplete-go'])
  call dein#local(s:srcpath_github, { 'on_ft': ['python', 'cython', 'pyrex'], 'frozen': 1, 'merged': 0 }, ['deoplete-plugins/deoplete-jedi'])
  call dein#local(s:srcpath_github, { 'on_ft': ['goasm', 'asm', 'gas', 'masm'], 'frozen': 1, 'merged': 0 }, ['deoplete-plugins/deoplete-asm'])
  call dein#local(s:srcpath_github, { 'on_ft': ['zsh'], 'frozen': 1, 'merged': 0 }, ['deoplete-plugins/deoplete-zsh'])
  call dein#add('Shougo/neco-vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neosnippet.vim', { 'depends': ['neosnippet-snippets'] })
  call dein#add('Shougo/neco-syntax')
  "" support
  call dein#add('Shougo/context_filetype.vim')
  call dein#add('Shougo/neoinclude.vim', { 'on_ft': ['c', 'cpp', 'go', 'objc', 'objcpp', 'swift'] })
  call dein#add('Shougo/echodoc.vim')
  call dein#add('Shougo/neopairs.vim')

  " Denite:
  call dein#add('Shougo/denite.nvim')
  "" dependency
  call dein#local(s:srcpath_github, { 'frozen': 1, 'merged': 0 }, ['nixprime/cpsm'])
  "" suorces

  " Completion:
  " call dein#local(s:srcpath_github, { 'frozen': 1, 'merged': 0 }, ['neoclide/coc.nvim'])

  " LanguageClient:
  call dein#local(s:srcpath_github, { 'frozen': 1, 'merged': 0 }, ['autozimu/LanguageClient-neovim'])
  call dein#add('junegunn/fzf', { 'lazy': 1, 'on_sorce': ['autozimu/LanguageClient-neovim'], 'build': 'echo n | ./install --no-key-bindings --no-completion --no-update-rc --no-bash --no-zsh --no-fish && go build -v -o ./bin/fzf .' })
  call dein#add('junegunn/fzf.vim', { 'lazy': 1, 'on_sorce': ['autozimu/LanguageClient-neovim']})
  call dein#add('liuchengxu/vista.vim', { 'on_cmd': ['Vista'] })
  call dein#add('neovim/nvim-lsp', { 'name': 'nvimlsp' })

  " Filer:
  call dein#add('Shougo/defx.nvim')
  call dein#add('kristijanhusak/defx-icons')

  " Git:
  call dein#add('airblade/vim-gitgutter')
  call dein#add('rhysd/git-messenger.vim', { 'on_cmd' : 'GitMessenger', 'on_map' : '<Plug>' })

  " Linter:
  call dein#add('dense-analysis/ale')

  " Formatter:
  call dein#add('rhysd/vim-clang-format', { 'on_cmd': ['ClangFormat', 'ClangFormatEchoFormattedCode', 'ClangFormatAutoToggle', 'ClangFormatAutoEnable', 'ClangFormatAutoDisable'], 'on_map': '<Plug>' })

  " Debugger:
  call dein#add('puremourning/vimspector', { 'lazy': 1 })  " call dein#local(s:srcpath_github, { 'frozen': 1, 'merged': 0 }, ['puremourning/vimspector'])
  call dein#local(s:srcpath_github, { 'on_cmd': ['NvimAPI'] }, ['tweekmonster/nvim-api-viewer'])

  " Insert:

  " References:

  " Interface:
  call dein#add('itchyny/lightline.vim')
  call dein#add('maximbaz/lightline-ale')
  call dein#add('mgee/lightline-bufferline')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('dhruvasagar/vim-zoom')
  call dein#add('frazrepo/vim-rainbow')
  call dein#add('voldikss/vim-floaterm', { 'on_cmd': ['FloatermNew', 'FloatermToggle', 'FloatermPrev', 'FloatermNext', 'FloatermHide'] })

  " Operator:
  call dein#add('kana/vim-operator-user')
  call dein#add('kana/vim-operator-replace', { 'on_map': '<Plug>', 'depends': 'vim-operator-user' })
  call dein#add('rhysd/vim-operator-surround', { 'on_map': '<Plug>', 'depends': 'vim-operator-user' })

  " Utility:
  call dein#add('AndrewRadev/switch.vim', { 'on_cmd': ['Switch'], 'on_func': ['switch#Switch'] })
  call dein#add('liuchengxu/vim-which-key', { 'on_cmd': ['WhichKey'] })
  call dein#add('utahta/trans.nvim', { 'build': 'make' })
  call dein#add('cocopon/colorswatch.vim', { 'on_cmd': ['ColorSwatchGenerate'] })
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('haya14busa/dein-command.vim', { 'on_cmd': ['Dein'] })
  call dein#add('haya14busa/vim-asterisk', { 'on_map': ['<Plug>'] })
  call dein#add('tweekmonster/helpful.vim', { 'on_cmd': ['HelpfulVersion'] })
  call dein#add('itchyny/vim-parenmatch')
  call dein#add('junegunn/vim-easy-align', { 'on_cmd': ['EasyAlign'], 'on_map': '<Plug>'})
  call dein#add('mattn/benchvimrc-vim', { 'on_cmd': ['BenchVimrc'] })
  call dein#add('mattn/sonictemplate-vim', { 'on_cmd': ['Template'] })
  call dein#add('rhysd/accelerated-jk')
  call dein#add('thinca/vim-quickrun', { 'on_cmd': ['Capture'] })
  call dein#add('tyru/caw.vim', { 'on_map': '<Plug>', 'rev': '364e803cfae2' })
  call dein#add('tyru/open-browser.vim')
  call dein#add('tyru/open-browser-github.vim', { 'on_cmd': ['OpenGithubFile', 'OpenGithubIssue', 'OpenGithubPullReq'], 'depends': ['open-browser.vim'] })
  call dein#add('tyru/open-browser-unicode.vim', { 'on_cmd': ['OpenBrowserUnicode'], 'depends': ['open-browser.vim'] })
  call dein#add('tweekmonster/startuptime.vim', { 'on_cmd': ['StartupTime'] })
  call dein#add('RRethy/vim-hexokinase', { 'on_cmd': ['HexokinaseToggle', 'HexokinaseRefresh'], 'build': 'git submodule update --init --remote --quiet && cd hexokinase && GO111MODULE=off go build' })
  call dein#add('RRethy/vim-illuminate', { 'on_event': ['BufEnter'] })
  call dein#add('rhysd/wandbox-vim', { 'on_cmd': ['Wandbox', 'WandboxAsync', 'WandboxSync', 'WandboxOptionList', 'WandboxOptionListAsync', 'WandboxAbortAsyncWorks', 'WandboxOpenBrowser']})
  call dein#add('kristijanhusak/vim-carbon-now-sh')
  call dein#add('rickhowe/diffchar.vim')
  call dein#add('rhysd/vim-grammarous')
  call dein#add('liuchengxu/vim-clap')

  " Lifelog:
  call dein#add('wakatime/vim-wakatime')

  " -----------------------------------------------------------------------------
  " Language Plugin:

  "" Go:
  call dein#add('tweekmonster/hl-goimport.vim', { 'on_ft': ['go']})
  call dein#local(s:srcpath_github, { 'frozen': 1, 'merged': 0 }, ['zchee/vim-go-testscript'])
  call dein#add('rhysd/vim-goyacc')
  call dein#add('zchee/vim-go-slide')
  call dein#local(s:gopath_src,  { 'frozen': 1, 'merged': 0, 'on_ft': ['go'] }, ['github.com/garyburd/vigor'])

  "" Cue
  call dein#add('jjo/vim-cue')

  "" C Family:
  call dein#add('vim-jp/vim-cpp')
  call dein#add('bfrg/vim-cpp-modern')
  call dein#add('octol/vim-cpp-enhanced-highlight')
  call dein#add('arakashic/chromatica.nvim')
  "" Swift:
  call dein#add('keith/swift.vim')
  "" CMake:
  call dein#add('pboettch/vim-cmake-syntax')
  call dein#add('neui/cmakecache-syntax.vim')

  "" Python:
  call dein#add('hynek/vim-python-pep8-indent')
  call dein#local(s:srcpath_github, { 'frozen': 1, 'merged': 0 }, ['lambdalisue/vim-cython-syntax'])  " call dein#add('lambdalisue/vim-cython-syntax')
  call dein#add('tweekmonster/impsort.vim')

  "" Rust:
  call dein#add('rust-lang/rust.vim', { 'on_ft': ['rust'] })

  "" Docker:
  call dein#add('ekalinin/Dockerfile.vim')

  "" Kubernetes:

  "" Protobuf:
  call dein#add('uarun/vim-protobuf')
  call dein#add('bufbuild/vim-buf')

  "" OPA:
  call dein#add('tsandall/vim-rego')

  "" Bazel:
  call dein#add('google/vim-maktaba')
  call dein#add('bazelbuild/vim-bazel', { 'on_ft': ['bazel'], 'depends': ['vim-maktaba'] })

  "" Assembly:
  call dein#add('Shirk/vim-gas')

  "" TypeScript:
  call dein#add('HerringtonDarkholme/yats.vim')

  "" Lua:
  call dein#add('xolox/vim-lua-ftplugin', { 'on_ft': ['lua'] })
  call dein#add('xolox/vim-misc', { 'on_ft': ['lua'] })

  "" Binary:
  call dein#add('Shougo/vinarise.vim', { 'on_cmd': ['Vinarise', 'VinarisePluginDump'] })

  "" Markdown:
  call dein#add('moorereason/vim-markdownfmt', { 'on_ft': ['markdown'] })
  call dein#add('iamcco/markdown-preview.nvim', { 'on_ft': ['markdown', 'pandoc.markdown', 'rmd'], 'build': 'cd app & yarn install' })

  "" Git:
  call dein#add('gisphm/vim-gitignore')
  call dein#add('lambdalisue/gina.vim')

  "" Vim:
  call dein#add('vim-jp/vimdoc-ja')
  call dein#add('vim-jp/syntax-vim-ex', { 'on_ft': ['vim'] })

  "" Shell:
  call dein#add('chrisbra/vim-sh-indent')

  "" Yaml:
  call dein#add('stephpy/vim-yaml')

  "" Toml:
  call dein#add('cespare/vim-toml')

  "" Json JsonC:
  call dein#add('elzr/vim-json')

  "" JsonSchema:

  "" GraphQL:
  call dein#add('jparise/vim-graphql')

  "" Kotlin:
  call dein#add('udalov/kotlin-vim')

  "" Tmux:
  call dein#add('tmux-plugins/vim-tmux')
  call dein#add('tmux-plugins/vim-tmux-focus-events')

  "" TerraFrom:
  call dein#add('hashivim/vim-terraform')

  "" Mustache Handlebars:
  call dein#add('mustache/vim-mustache-handlebars')

  "" Jinja2:
  call dein#add('glench/vim-jinja2-syntax')

  "" TinyScheme:  For macOS sandbox-exec profile *.sb tinyscheme filetype
  call dein#add('vim-scripts/vim-niji', { 'on_ft': ['scheme'] })

  " macos modulemap 
  call dein#add('compnerd/modulemap-vim')

  "" GLSL:
  call dein#add('tikhomirov/vim-glsl')

  "" PlantUML:
  call dein#add('aklt/plantuml-syntax')
  call dein#add('weirongxu/plantuml-previewer.vim', { 'depends': ['vim-maktaba'] })

  " Testing Plugin:
  " call dein#add('aklt/plantuml-syntax')
  " call dein#add('andrewstuart/vim-kubernetes')
  " call dein#add('bagrat/vim-buffet')
  " call dein#add('cocopon/pgmnt.vim', { 'on_cmd': ['PgmntDevInspect'] })
  " call dein#add('cocopon/vaffle.vim')
  " call dein#add('davidhalter/jedi-vim', {'lazy': 1, 'on_ft': ['python', 'cython', 'pyrex'] })
  " call dein#add('fatih/vim-go', { 'on_ft': ['go'], 'lazy': 1 })
  " call dein#add('godlygeek/tabular')
  " call dein#add('google/ijaas')
  " call dein#add('google/vim-searchindex')
  " call dein#add('juliosueiras/vim-terraform-completion', { 'lazy': 1 })
  " call dein#add('kana/vim-niceblock')
  " call dein#add('kristijanhusak/defx-git')
  " call dein#add('mbbill/undotree')
  " call dein#add('mrk21/yaml-vim')
  " call dein#add('norcalli/nvim-colorizer.lua')
  " call dein#add('numirias/semshi')
  " call dein#add('Quramy/vison', { 'on_ft': ['jsonschema'] })
  " call dein#add('raghur/fruzzy')
  " call dein#add('rhysd/vim-gfm-syntax', { 'on_ft': ['markdown'] })
  " call dein#add('rhysd/vim-github-support')
  " call dein#add('sakhnik/nvim-gdb')
  " call dein#add('scrooloose/nerdtree', { 'on_cmd': ['NERDTree', 'NERDTreeVCS', 'NERDTreeFromBookmark', 'NERDTreeToggle', 'NERDTreeFocus', 'NERDTreeMirror', 'NERDTreeClose', 'NERDTreeFind', 'NERDTreeCWD', 'NERDTreeRefreshRoot'] })
  " call dein#add('scrooloose/vim-slumlord')
  " call dein#add('sheerun/vim-polyglot', { 'lazy' : 1 })
  " call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  " call dein#add('simnalamburt/vim-mundo')
  " call dein#add('tmsvg/pear-tree', { 'on_event': 'InsertEnter' })
  " call dein#add('tweekmonster/wstrip.vim')
  " call dein#add('uber/prototool', {'rtp': 'vim/prototool'} )
  " call dein#add('vim-airline/vim-airline')
  " call dein#add('vim-airline/vim-airline-themes', { 'depends': ['vim-airline/vim-airline'] })
  " call dein#add('wellle/targets.vim')
  " call dein#local($XDG_CONFIG_HOME.'/nvim/', { 'on_ft': ['python', 'cython', 'pyrex'], 'frozen': 1, 'merged': 0 }, ['kite'])
  " call dein#local(s:srcpath_github, { 'frozen': 1, 'merged': 0, 'on_ft': ['go', 'asm', 'gomod'] }, ['fatih/vim-go'])
  " call dein#local(s:srcpath_github, { 'frozen': 1, 'merged': 0 }, ['neoclide/coc.nvim'])
  " call dein#local(s:srcpath_github, { 'frozen': 1, 'merged': 0, 'lazy': 1 }, ['Valloric/YouCompleteMe'])
  " call dein#local(s:srcpath_github, { 'on_ft': ['go', 'asm', 'gomod'], 'augroup': 'VimEnter', 'frozen': 1, 'merged': 0 }, ['zchee/vim-go'])

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

" -------------------------------------------------------------------------------------------------
"" Neovim:

let g:termdebugger = '/usr/local/bin/gdb'
let g:termdebug_useFloatingHover = 1

function! s:nvim_terminal_config()
  if exists('g:loaded_nvim_terminal_config')
    silent! finish
  endif
  let g:loaded_nvim_terminal_config = 1

  let g:terminal_scrollback_buffer_size = 100000
  let s:num = 0
  "        black      red        green      yellow     blue       magenta    cyan       white
  for s:color in [
        \ '#101112', '#b24e4e', '#9da45a', '#f0c674', '#5f819d', '#85678f', '#5e8d87', '#707880',
        \ '#373b41', '#cc6666', '#a0a85c', '#f0c674', '#81a2be', '#b294bb', '#8abeb7', '#c5c8c6',
        \ ]
    let g:terminal_color_{s:num} = s:color
    let s:num += 1
  endfor
endfunction
Gautocmd TermOpen * call s:nvim_terminal_config()
Gautocmd TermOpen * setlocal nonumber sidescrolloff=0 scrolloff=0 statusline=%{b:term_title} notimeout ttimeout timeoutlen=100
Gautocmd BufNewFile,BufRead,BufEnter term://* startinsert
Gautocmd BufLeave term://* stopinsert

" -------------------------------------------------------------------------------------------------
" Color:

"" Go:
let g:go_highlight_error = 1
let g:go_highlight_return = 0

"" C:
let g:c_ansi_constants = 1
let g:c_ansi_typedefs = 1
let g:c_comment_strings = 1
let g:c_gnu = 0
let g:c_no_curly_error = 1
let g:c_no_tab_space_error = 1
let g:c_no_trail_space_error = 1
let g:c_syntax_for_h = 0

" CPP:
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

" Perl:
let perl_include_pod = 1
let perl_no_scope_in_variables = 0
let perl_no_extended_vars = 0
let perl_string_as_statement = 1
let perl_no_sync_on_sub = 0
let perl_no_sync_on_global_var = 0
let perl_sync_dist = 100

" -------------------------------------------------------------------------------------------------
" Gautocmd:

" Global:
Gautocmd InsertLeave * setlocal nopaste

" always jump to the last known cursor position
"  https://github.com/neovim/neovim/blob/master/runtime/vimrc_example.vim
function! s:autoJump()
  if line("'\"") > 1 && line("'\"") <= line("$") && &filetype != 'gitcommit' && &filetype != 'gitrebase'
    execute "silent! keepjumps normal! g`\"zz"
  endif
endfunction
Gautocmd BufWinEnter * call s:autoJump()

"" automatically close window
"  http://stackoverflow.com/questions/7476126/how-to-automatically-close-the-quick-fix-window-when-leaving-a-file
function! s:autoClose()
  let s:ft = getbufvar(winbufnr(winnr()), "&filetype")
  if winnr('$') == 1
    if s:ft == 'qf' || s:ft == 'vista'
      quit!
    endif
  endif
endfunction
Gautocmd WinEnter * call s:autoClose()

" macOS Frameworks and system header protection
Gautocmd BufNewFile,BufReadPost /System/Library/*,/Applications/Xcode*,/usr/include*,/usr/lib* setlocal readonly nomodified

"" less like mapping:
function! LessMap()
  setlocal colorcolumn=""
  let b:gitgutter_enabled = 0
  nnoremap <silent><buffer>u <C-u>
  nnoremap <silent><buffer>d <C-d>
  nnoremap <silent><buffer>q :q<CR>
endfunction
Gautocmdft godoc://*,godoc,help,man,qf,quickrun,ref call LessMap()  " less like keymappnig
Gautocmd BufEnter option-window,__LanguageClient__,__GO_TEST__ call LessMap()  " :option have not filetype

"" HighlightCursorAfterJump:
function! NoCursorline(timer)
  if &cursorline
    silent! setlocal nocursorline
  endif
endfunc
" Gautocmd VimEnter * silent! setlocal nocursorline

let g:highlight_cursor_prev_bufnr = 0
function! s:HighlightCursorAfterJump()
  let l:bn = bufnr('%')
  if g:highlight_cursor_prev_bufnr != l:bn
    let g:highlight_cursor_prev_bufnr = l:bn
    setlocal cursorline
  endif

  call timer_start(800, 'NoCursorline', {'repeat': 1})
endfunction
" Gautocmd BufEnter * call s:HighlightCursorAfterJump()


" Plugins:
"" Neosnippet:
Gautocmd InsertLeave * NeoSnippetClearMarkers

"" Gina:
" Gautocmd BufEnter gina://*:commit startinsert
" Gautocmd BufEnter gina://* nnoremap <silent><buffer>q :q<CR>

"" Man:
" Gautocmdft man://* nmap  <buffer><nowait>j  <Plug>(accelerated_jk_gj_position)
" Gautocmdft man://* nmap  <buffer><nowait>k  <Plug>(accelerated_jk_gk_position)


" Language:
"" Go:

"" C:

"" Protobuf:

"" Dockerfile:

" Python:

" Vim:
"" nested autoload
" Gautocmd BufWritePost $MYVIMRC ++nested silent! source $MYVIMRC
Gautocmdft vim setlocal tags+=$XDG_DATA_HOME/nvim/tags/runtime.tags
Gautocmdft qf hi Search  gui=None  guifg=None  guibg=#373b41
Gautocmd   BufEnter **/colors/*.vim,**/colorscheme/*.vim  silent! HexokinaseToggle
Gautocmd   BufEnter $XDG_CONFIG_HOME/kitty/*.conf  silent! HexokinaseToggle

"" Gitcommit:
Gautocmd BufEnter COMMIT_EDITMSG  startinsert

"" Yaml:

"" Misc:
Gautocmdft jsp,asp,php,xml,perl syntax sync minlines=500 maxlines=1000

" Gautocmd FileType * lua require'colorizer'.setup()

" -------------------------------------------------------------------------------------------------
" Plugin Setting:

" COC:
let $NVIM_COC_LOG_LEVEL = 'debug'

" LLVM library path
if isdirectory('/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr')
  let s:llvm_base_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr'
  let s:llvm_clang_version = '11.0.3'
elseif isdirectory('/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr')
  let s:llvm_base_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr'
  let s:llvm_clang_version = '11.0.3'
elseif isdirectory('/opt/llvm/devel')
  let s:llvm_base_path = '/opt/llvm/devel'
  let s:llvm_clang_version = '11.0.0'
elseif isdirectory('/opt/llvm/stable')
  let s:llvm_base_path = '/opt/llvm/stable'
  let s:llvm_clang_version = '10.0.0'
elseif isdirectory('/Library/Developer/CommandLineTools/usr')
  let s:llvm_base_path = '/Library/Developer/CommandLineTools/usr'
  let s:llvm_clang_version = '11.0.3'
else
  echoerr 'not found s:llvm_base_path and s:llvm_clang_version'
endif

"" LSP:

""" --resource-dir: /opt/llvm/devel/bin/clang -print-resource-dir
let g:lsp_commands_cfamily = [
      \ '/opt/llvm/devel/bin/clangd',
      \
      \ '--all-scopes-completion',
      \ '--clang-tidy',
      \ '--compile_args_from=filesystem',
      \ '--completion-parse=auto',
      \ '--completion-style=detailed',
      \ '--cross-file-rename',
      \ '--function-arg-placeholders',
      \ '--header-insertion-decorators',
      \ '--header-insertion=iwyu',
      \ '--include-ineligible-results',
      \ '--j=16',
      \ '--offset-encoding=utf-8',
      \ '--pch-storage=memory',
      \ '--resource-dir=/opt/llvm/devel/lib/clang/11.0.0',
      \ '--static-func-full-module-prefix',
      \ '--suggest-missing-includes',
      \ ]
      "\ '--background-index',
      "\ '--debug-origin',
      "\ '--info-output-file=/tmp/clangd.info.log', '--input-mirror-file=/tmp/clangd.lsp.log', '--log=verbose', '--pretty', '--input-style=standard', '--offset-encoding=utf-8',
      "\ '--stats',

let g:c_cpp_root_path = ''
Gautocmdft c,cpp,objc,objcpp ++once let g:c_cpp_root_path = fnamemodify(trim(finddir('.git', '.;'), '.git'), ':p:h')

let g:did_server_commands_cfamily_setup = v:false
function! s:lsp_commands_cfamily_setup() abort
  if g:did_server_commands_cfamily_setup
    return
  endif
  let g:did_server_commands_cfamily_setup = v:true

  " clangd.dex
  if filereadable(g:c_cpp_root_path . '/build/clangd.dex')
    let g:lsp_commands_cfamily += ['--index', '--index-file=' . g:c_cpp_root_path . '/build/clangd.dex']
  elseif filereadable(g:c_cpp_root_path . '/clangd.dex')
    let g:lsp_commands_cfamily += ['--index', '--index-file=' . g:c_cpp_root_path . '/clangd.dex']
  " compile_commands.json
  elseif filereadable(g:c_cpp_root_path . '/compile_commands.json')
    let g:lsp_commands_cfamily += ['--compile-commands-dir=' . g:c_cpp_root_path]
  elseif filereadable(g:c_cpp_root_path . '/build/compile_commands.json')
    let g:lsp_commands_cfamily += ['--compile-commands-dir=' . g:c_cpp_root_path . '/build']
  elseif filereadable(g:c_cpp_root_path . '/out/Release/compile_commands.json')
    let g:lsp_commands_cfamily += ['--compile-commands-dir=' . g:c_cpp_root_path . '/out/Release']
  else 
    let g:lsp_commands_cfamily += ['--index']
  endif
endfunction
Gautocmdft c,cpp,objc,objcpp call s:lsp_commands_cfamily_setup()

let s:lsp_root_markers_cfamily = ['WORKSPACE', '.clang-format', 'autogen.sh', 'configure']
let s:lsp_root_markers_go = ['go.mod', 'Gopkg.toml']
let s:lsp_root_markers_js = ['package.json', 'tsconfig.json', 'yarn.lock']
let s:lsp_root_markers_python = ['setup.py', 'pyproject.toml', 'tox.ini', '.flake8']
let s:lsp_root_markers_rust = ['Cargo.toml', 'rustfmt.toml']
let s:lsp_root_markers = {
      \ 'c': s:lsp_root_markers_cfamily,
      \ 'cpp': s:lsp_root_markers_cfamily,
      \ 'go': s:lsp_root_markers_go,
      \ 'javascript': s:lsp_root_markers_js,
      \ 'objc': s:lsp_root_markers_cfamily,
      \ 'objcpp': s:lsp_root_markers_cfamily,
      \ 'python': s:lsp_root_markers_python,
      \ 'rust': s:lsp_root_markers_rust,
      \ 'typescript': s:lsp_root_markers_js,
      \ }
" let s:node_exec = ['node', '--experimental-json-modules', '--experimental-vm-modules', '--experimental-wasi-unstable-preview1', '--experimental-wasm-modules', '--experimental-wasm-modules', '--unhandled-rejections=none', '--no-warnings', '--no-deprecation', '--unhandled-rejections=none']


"" NvimLSP:
let g:nvim_lsp_server_commands = {
      \ 'go': [s:gopath . '/bin/gopls', '-v', '-remote', 'unix;/tmp/gopls.sock', '-logfile=/tmp/gopls.log', '-rpc.trace', '-telemetry.disable=true'],
      \ 'goomd': [s:gopath . '/bin/gopls', '-v', '-logfile=/tmp/gopls-gomod.log', '-rpc.trace', '-telemetry.disable=true'],
      \ 'rust': ['/usr/local/rust/cargo/bin/rustup', 'run', 'nightly', 'rls'],
      \ 'yaml': [s:srcpath_github . 'redhat-developer/yaml-language-server/bin/yaml-language-server', '--stdio'],
      \ }
      "\ 'go': [s:gopath . '/bin/gopls', '-v', '-logfile=/tmp/gopls.log', '-rpc.trace', '-telemetry.disable=true'],
      "\ 'go': [s:gopath . '/bin/gopls', '-v', '-remote', 'unix;/tmp/gopls.sock', '-logfile=/tmp/gopls.log', '-rpc.trace', '-debug=localhost:75699'],
" let g:nvim_lsp#server_options = {
" \ 'go': {
" \   'env': [
" \     'GOOS=linux',
" \   ]}
" \ }
let g:nvim_lsp#change_throttle = 0.5
let g:nvim_lsp_debug = v:true
let g:nvim_lsp_enable_diagnostics = v:true
let g:nvim_lsp_settings_paths = [ '.nvim/settings.json', $XDG_CONFIG_HOME.'/nvim/lsp/settings.json' ]
let g:nvim_lsp_root_markers = s:lsp_root_markers
let g:nvim_lsp_use_virtual_text = v:true
let g:nvim_lsp_diagnostics_list = 'quickfix'
let g:nvim_lsp_selection_ui_type = 'quickfix'
let g:nvim_lsp_selection_ui_auto_open = v:true
let g:nvim_lsp_logLevel = 'debug'
let g:nvim_lsp_debug_profile_cpu = '/tmp/go/nvim-lsp-cpu.pprof'
" let g:nvim_lsp_debug_profile_memory = '/tmp/go/memory.pprof'
" let g:nvim_lsp_debug_profile_trace = '/tmp/go/trace.pprof'
" let g:nvim_lsp#diagnostics_display = {
"     \ 1: {
"     \   'name': 'Error',
"     \   'texthl': 'ALEError',
"     \   'signText': '✖',
"     \   'signTexthl': 'ALEErrorSign',
"     \   'virtualTexthl': 'Error',
"     \   },
"     \ 2: {
"     \   'name': 'Warning',
"     \   'texthl': 'ALEWarning',
"     \   'signText': '⚠',
"     \   'signTexthl': 'ALEWarningSign',
"     \   'virtualTexthl': 'Todo',
"     \   },
"     \ 3: {
"     \   'name': 'Information',
"     \   'texthl': 'ALEInfo',
"     \   'signText': 'ℹ',
"     \   'signTexthl': 'ALEInfoSign',
"     \   'virtualTexthl': 'Todo',
"     \   },
"     \ 4: {
"     \   'name': 'Hint',
"     \   'texthl': 'ALEInfo',
"     \   'signText': '➤',
"     \   'signTexthl': 'ALEInfoSign',
"     \   'virtualTexthl': 'Todo',
"     \   },
"     \ }

"" Deoplete:
let g:deoplete#enable_at_startup = 1
let s:default_ignore_sources = ['around', 'dictionary', 'member', 'omni', 'tag', 'ale', 'LanguageClient']
let s:deoplete_custom_option = {
      \ 'auto_complete': v:true,
      \ 'auto_complete_delay': 0,
      \ 'auto_refresh_delay': 200,
      \ 'camel_case': v:false,
      \ 'check_stderr': v:true,
      \ 'ignore_case': v:true,
      \ 'ignore_sources': {
      \   '_': s:default_ignore_sources,
      \   'c': s:default_ignore_sources+['buffer', 'neosnippet'],
      \   'cpp': s:default_ignore_sources+['buffer', 'neosnippet'],
      \   'dockerfile': s:default_ignore_sources,
      \   'go': s:default_ignore_sources,
      \   'javascript': s:default_ignore_sources,
      \   'lua': s:default_ignore_sources,
      \   'objc': s:default_ignore_sources+['buffer', 'neosnippet'],
      \   'python': s:default_ignore_sources,
      \   'rust': s:default_ignore_sources,
      \   'sh': s:default_ignore_sources,
      \   'swift': s:default_ignore_sources,
      \   'typescript': s:default_ignore_sources,
      \   'yaml': s:default_ignore_sources,
      \   'yaml.docker-compose': s:default_ignore_sources+['buffer'],
      \   'zsh': s:default_ignore_sources+['buffer'],
      \ },
      \ 'max_list': 10000,
      \ 'num_processes': -1,
      \ 'on_insert_enter': v:true,
      \ 'on_text_changed_i': v:true,
      \ 'profile': v:false,
      \ 'prev_completion_mode': 'filter',
      \ 'refresh_always': v:true,
      \ 'skip_multibyte': v:true,
      \ 'smart_case': v:true,
      \ 'min_pattern_length': 1,
      \ }
      "\ 'candidate_marks': [],
      "\ 'skip_chars': ['(', ')', '<', '>'],
      "\ 'keyword_patterns': {
      "\   '_': '[a-zA-Z_]\k*',
      "\   'tex': '\\?[a-zA-Z_]\w*',
      "\ },
      "\ 'omni_patterns': {},
      "\ 'keyword_patterns': {},
      "\ 'sources':{},
call deoplete#custom#option(s:deoplete_custom_option)
call deoplete#custom#source('_', 'converters', ['converter_auto_paren', 'converter_remove_overlap'])
call deoplete#custom#source('_', 'matchers', ['matcher_cpsm'])  " matcher_fuzzy, matcher_full_fuzzy, matcher_cpsm, matcher_head, matcher_length
call deoplete#custom#source('_', 'sorters', ['sorter_word'])  " sorter_rand
call deoplete#custom#source('_', 'disabled_syntaxes', ['goComment', 'Comment'])

call deoplete#custom#source('buffer', 'rank', 200)
call deoplete#custom#source('file', 'rank', 300)
call deoplete#custom#source('file', 'force_completion_length', 1)

call deoplete#custom#source('go', 'rank', 500)

call deoplete#custom#source('LanguageClientInternal', 'converters', ['converter_auto_paren_lsp', 'converter_auto_paren', 'converter_remove_overlap'])
call deoplete#custom#source('LanguageClientInternal', 'matchers', ['matcher_cpsm'])
call deoplete#custom#source('LanguageClientInternal', 'sorters', [])
Gautocmdft json,yaml call deoplete#custom#source('LanguageClientInternal', 'min_pattern_length', 0)

call deoplete#custom#source('asm', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#source('asm', 'sorters', ['sorter_word'])
call deoplete#custom#source('asm', 'rank', 1000)

" call deoplete#custom#source('neosnippet', 'disabled_syntaxes', ['Comment'])
call deoplete#custom#source('neosnippet', 'rank', 200)

" call deoplete#custom#source('zsh', 'refresh_always', v:false)
" call deoplete#custom#source('zsh', 'auto_refresh_delay', 1)
" call deoplete#custom#source('zsh', 'matchers', ['matcher_fuzzy'])
" call deoplete#custom#source('zsh', 'sorters', ['sorter_word'])

" source
"" go
let g:deoplete#sources#go#gocode_binary = s:gopath.'/bin/gocode'
" let g:deoplete#sources#go#gocode_binary = s:gopath.'/bin/gocode-stamblerre'
" let g:deoplete#sources#go#gocode_sock = 'unix'
let g:deoplete#sources#go#auto_goos = 1
let g:deoplete#sources#go#pointer = 0
" let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#cgo = 1
let g:deoplete#sources#go#cgo_only = 1

let g:deoplete#sources#go#cgo#libclang_path = s:llvm_base_path . '/lib/libclang.dylib'  " '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
let g:deoplete#sources#go#cgo#sort_algo = 'priority'  " 'priority', 'alphabetical'
let s:clang_flags = [
      \ '-I/usr/local/include',
      \ '-I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
      \ '-I' . s:llvm_base_path . '/include/c++/v1',
      \ '-I/usr/include',
      \ '-F/System/Library/Frameworks',
      \ '-F/Library/Frameworks',
      \ '-isystem' . s:llvm_base_path . '/lib/clang/' . s:llvm_clang_version,
      \ '-isysroot/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk',
      \ ]  " clang++ -v -E -x c++ - -v < /dev/null
      "\ '-I' . s:llvm_base_path . '/include/c++/v1',
let g:deoplete#sources#go#cgo#flags = s:clang_flags
"" clang
let g:deoplete#sources#clang#clang_header = s:llvm_base_path . '/lib/clang'
let g:deoplete#sources#clang#libclang_path = s:llvm_base_path . '/lib/libclang.dylib'
let g:deoplete#sources#clang#flags = s:clang_flags
"" jedi
let g:deoplete#sources#jedi#statement_length = 0
let g:deoplete#sources#jedi#short_types = 0
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#enable_typeinfo = 1
let g:deoplete#sources#jedi#ignore_errors = 1
let g:deoplete#sources#jedi#extra_path = []
let g:deoplete#sources#jedi#python_path = g:python3_host_prog
" asm
let g:deoplete#sources#asm#go_mode = 1
" neopairs
let g:neopairs#enable = 1
" echodoc
let g:echodoc#enable_at_startup = 1
" let g:echodoc#events = ['CompleteDone']  " default
let g:echodoc#type = 'virtual'  " echo, signature, virtual, floating
let g:echodoc#highlight_identifier = 'Identifier'  " default
let g:echodoc#highlight_arguments = 'Special'  " default
let g:echodoc#highlight_trailing = 'Type'  " default
let g:echodoc_max_blank_lines = 50
" call echodoc#register('default', {'name': 'default', 'rank': 1000, 'filetypes': ['go'], 'search': 'LanguageClient#textDocument_signatureHelp'})
" neosnippet
let g:neosnippet#data_directory = $XDG_CACHE_HOME . '/nvim/neosnippet'
let g:neosnippet#disable_runtime_snippets = {}
let g:neosnippet#disable_select_mode_mappings = 0
let g:neosnippet#enable_auto_clear_markers = 1
let g:neosnippet#enable_complete_done = 0
let g:neosnippet#enable_completed_snippet = 0
let g:neosnippet#expand_word_boundary = 1
let g:neosnippet#snippets_directory = $XDG_CONFIG_HOME . '/nvim/neosnippets'
let g:neosnippet_username = 'zchee'
let g:neosnippet_author = 'Koichi Shiraishi'
" debug
" call deoplete#custom#option('profile', v:true)
" call deoplete#enable_logging('DEBUG', '/tmp/deoplete.log')
" call deoplete#custom#source('LanguageClientInternal', 'is_debug_enabled', v:true)


"" LanguageClient:
let g:LanguageClient_autoStart = 1
let g:LanguageClient_autoStop = 1
let g:LanguageClient_applyCompletionAdditionalTextEdits = 1
let g:LanguageClient_changeThrottle = v:null  " default: v:null, 0.5
let g:LanguageClient_completionPreferTextEdit = 0  " should be 0
let g:LanguageClient_diagnosticsList = 'Disabled'  " default: Quickfix, Location, Disabled
let g:LanguageClient_echoProjectRoot = 1
let g:LanguageClient_fzfContextMenu = 0
let g:LanguageClient_fzfOptions = v:null
let g:LanguageClient_hasSnippetSupport = 0
let g:LanguageClient_hoverPreview = 'Always'  " Always, Auto, Never
let g:LanguageClient_selectionUI = 'location-list'  " fzf, quickfix, location-list
let g:LanguageClient_trace = 'off'  " 'verbose'
let g:LanguageClient_useFloatingHover = 1
let g:LanguageClient_useVirtualText = "All"
let g:LanguageClient_waitOutputTimeout = 10  " default: 10
let g:LanguageClient_windowLogMessageLevel = 'Warning'  " default: Warning, Info, Log, Error
let g:LanguageClient_serverCommands = {
      \ 'c': g:lsp_commands_cfamily,
      \ 'cpp': g:lsp_commands_cfamily,
      \ 'dockerfile': ['docker-langserver', '--stdio'],
      \ 'go': [s:gopath . '/bin/gopls', '-remote', 'unix;/tmp/gopls.sock', '-logfile=/tmp/gopls-lc.log', '-telemetry.disable=true'],
      \ 'gomod': [s:gopath . '/bin/gopls', '-logfile=/tmp/gopls-lc.log', '-telemetry.disable=true'],
      \ 'java': ['jdtls', '-data', getcwd()],
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'json': ['vscode-json-languageserver', '--stdio'],
      \ 'jsonc': ['vscode-json-languageserver', '--stdio'],
      \ 'jsonschema': ['vscode-json-languageserver', '--stdio'],
      \ 'lua': ['lua-lsp'],
      \ 'objc': g:lsp_commands_cfamily,
      \ 'objcpp': g:lsp_commands_cfamily,
      \ 'proto': [s:gopath . '/bin/protocol-buffers-language-server'],
      \ 'python': ['/usr/local/share/pipx/pyls', '--log-file=/tmp/pyls.log', '--verbose'],
      \ 'ruby': ['solargraph', 'stdio'],
      \ 'rust': ['/usr/local/rust/cargo/bin/rustup', 'run', 'nightly', 'rls'],
      \ 'sh': ['bash-language-server', 'start'],
      \ 'swift': ['/usr/local/bin/sourcekit-lsp'],
      \ 'typescript': ['typescript-language-server', '--stdio', '--tsserver-path=tsserver'],
      \ 'vim': ['vim-language-server', '--stdio'],
      \ 'yaml': [s:srcpath_github . 'redhat-developer/yaml-language-server/bin/yaml-language-server', '--stdio'],
      \ }
      "\ 'c': ['ccls', '--log-file=/tmp/cc.log'],
      "\ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
      "\ 'go': [s:gopath . '/bin/gopls', '-logfile=/tmp/gopls-lc.log'],
      "\ 'go': [s:gopath . '/bin/gopls', '-v', '-logfile', '/tmp/gopls-lc.log', '-rpc.trace'],
      "\ 'javascript': s:node_exec + [$XDG_DATA_HOME.'/yarn/global/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],
      "\ 'json': ['vscode-json-languageserver', '--stdio'],
      "\ 'lua': ['java', '-cp', /usr/local/share/java/EmmyLua-LS-all.jar', 'com.tang.vscode.MainKt'],
      "\ 'lua': ['lua-language-server', '-i'],
      "\ 'lua': ['lua-lsp'],
      "\ 'python': ['/usr/local/bin/pyls'],
      "\ 'python': ['/usr/local/share/pipx/pyls'],
      "\ 'rust': ['/usr/local/rust/cargo/bin/ra_lsp_server'],
      "\ 'rust': ['/usr/local/rust/cargo/bin/rustup', 'run', 'nighly', 'ra_lsp_server'],
      "\ 'rust': ['/usr/local/rust/cargo/bin/rustup', 'run', 'nightly', 'ra_lsp_server'],
      "\ 'sh': ['nodebrew', 'exec', 'v10.16.0', '--', 'node', '--experimental-json-modules', '--experimental-modules', '--experimental-vm-modules', '--no-warnings', '/usr/local/var/nodebrew/node/v10.16.0/lib/node_modules/bash-language-server/bin/main.js', 'start'],
      "\ 'typescript': ['/usr/local/var/yarn/bin/typescript-language-server', '--stdio', '--tsserver-path=tsserver'],
      "\ 'typescript': s:node_exec + [s:srcpath_github . 'sourcegraph/javascript-typescript-langserver/lib/language-server-stdio.js'],
      "\ 'typescript': s:node_exec + [s:srcpath_github . 'sourcegraph/javascript-typescript-langserver/lib/language-server-stdio.js'],
      "\ 'typescript':['javascript-typescript-stdio'],
      "\ 'vim': ['vim-language-server', '--stdio'],
      "\ 'yaml': s:node_exec + [s:srcpath_github . 'redhat-developer/yaml-language-server/out/server/src/server.js', '--stdio'],
      "\ 'zsh': ['nodebrew', 'exec', 'v10.16.0', '--', '/usr/local/var/nodebrew/node/v10.16.0/lib/node_modules/bash-language-server/bin/main.js', 'start'],
let g:LanguageClient_rootMarkers = s:lsp_root_markers
let g:LanguageClient_loadSettings = 1
Gautocmdft go,python,yaml let g:LanguageClient_diagnosticsEnable = 0
" debug
" let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
" let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'
" let g:LanguageClient_loggingLevel = 'DEBUG'  " default: WARN

function! OmniCompleteResults(...) abort
  return get(a:000, 1, g:LanguageClient_omniCompleteResults)
endfunction!

"" VimLanguageServer:
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

"" Denite:
call denite#custom#option('_', {
      \ 'auto_action': "",
      \ 'auto_resize': v:false,
      \ 'buffer_name': 'default',
      \ 'cursor_pos': '',
      \ 'cursorline': v:true,
      \ 'default_action': 'default',
      \ 'direction': 'botright',
      \ 'do': '',
      \ 'empty': v:false,
      \ 'highlight_filter_background': 'NormalFloat',
      \ 'highlight_matched_char': 'Search',
      \ 'highlight_matched_range': 'Underlined',
      \ 'highlight_preview_line': 'Search',
      \ 'highlight_prompt': 'Special',
      \ 'highlight_window_background': 'NormalFloat',
      \ 'ignorecase': v:true,
      \ 'immediately': v:false,
      \ 'immediately_1': v:false,
      \ 'matchers': 'matcher/cpsm',
      \ 'prompt': '>',
      \ 'sorter': 'sorter/word',
      \ 'statusline': v:false,
      \ 'unique': v:true,
      \ 'winheight': 20,
      \ })
" call denite#custom#source('_', 'matchers', ['matcher/cpsm'])
" call denite#custom#source('line', 'matchers', ['matcher/cpsm'])
" call denite#custom#source('buffer', 'matchers', ['matcher/cpsm'])
let s:denite_file_rec_command = ['fd', '.', '--threads=16', '--follow', '--hidden', '--no-ignore', '--full-path', '--color=never', '--type', 'f',
      \ '-E', '.git/',
      \ '-E', 'vendor/',
      \ '-E', 'node_modules/',
      \ '-E', '*.bak',
      \ '-E', '*.o',
      \ '-E', '*.obj',
      \ '-E', '*.pdb',
      \ '-E', '*.exe',
      \ '-E', '*.bin',
      \ '-E', '*.dll',
      \ '-E', '*.a',
      \ '-E', '*.lib',
      \ '-E', '.gitignore',
      \ '-E', '.*.*',
      \ ]
      "\ '-E', 'target/',  " rust
call denite#custom#var('file/rec', 'command', s:denite_file_rec_command)

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--no-config', '--mmap', '--threads=16', '--hidden', '--ignore-case', '--vimgrep', '--no-heading', '--glob=!.git', '--glob=!node_modules'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

"" map
function! s:denite_settings() abort
  nnoremap <silent><buffer><expr><C-c>  denite#do_map('quit')
  nnoremap <silent><buffer><expr><C-v>  denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr><CR>   denite#do_map('do_action')
  nnoremap <silent><buffer><expr>q      denite#do_map('quit')
  nnoremap <silent><buffer><expr>i      denite#do_map('open_filter_buffer')

  inoremap <silent><buffer><expr><C-c>  denite#do_map('quit')
endfunction
Gautocmdft denite call s:denite_settings()
" Gautocmd InsertLeave denite-filter wincmd p

"" filter
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ ['*~', '*.o', '*.exe', '*.bak', '.DS_Store', '*.pyc', '*.sw[po]', '*.class', '.hg/', '.git/', '.bzr/', '.svn/', 'tags', 'tags-*', '.ropeproject/', '__pycache__/', 'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

"" Defx:
call defx#custom#option('_', {
      \ 'columns': 'icons:indent:git:indent:filename:type',
      \ 'ignored_files': '.git,.DS_Store',
      \ })
let g:defx_git#indicators = {
      \ 'Modified'  : '✹',
      \ 'Staged'    : '✚',
      \ 'Untracked' : '✭',
      \ 'Renamed'   : '➜',
      \ 'Unmerged'  : '═',
      \ 'Ignored'   : '☒',
      \ 'Deleted'   : '✖',
      \ 'Unknown'   : '?'
      \ }
function! s:defx_settings() abort
  nnoremap <silent><buffer><expr><C-g>   defx#do_action('print')
  nnoremap <silent><buffer><expr><C-l>   defx#do_action('redraw')
  nnoremap <silent><buffer><expr><CR>    defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><buffer><expr><Down>  'j'
  nnoremap <silent><buffer><expr><Left>  defx#do_action('close_tree')
  nnoremap <silent><buffer><expr><Right> defx#do_action('open_tree')
  nnoremap <silent><buffer><expr><Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr><Up>    'k'
  nnoremap <silent><buffer><expr>*       defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr>-       defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr>.       defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr>c       defx#do_action('copy')
  nnoremap <silent><buffer><expr>cd      defx#do_action('change_vim_cwd')
  nnoremap <silent><buffer><expr>d       defx#do_action('remove')
  nnoremap <silent><buffer><expr>j       'j'
  nnoremap <silent><buffer><expr>K       defx#do_action('new_directory')
  nnoremap <silent><buffer><expr>k       'k'
  nnoremap <silent><buffer><expr>o       defx#do_action('open')
  nnoremap <silent><buffer><expr>m       defx#do_action('move')
  nnoremap <silent><buffer><expr>N       defx#do_action('new_file')
  nnoremap <silent><buffer><expr>p       defx#do_action('paste')
  nnoremap <silent><buffer><expr>q       defx#do_action('quit')
  nnoremap <silent><buffer><expr>r       defx#do_action('rename')
  nnoremap <silent><buffer><expr>s       defx#do_action('multi', [['drop', 'split'], 'quit'])
  nnoremap <silent><buffer><expr>v       defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
  nnoremap <silent><buffer><expr>x       defx#do_action('execute_system')
  nnoremap <silent><buffer><expr>yy      defx#do_action('yank_path')
  nnoremap <silent><buffer><expr>~       defx#do_action('cd')
endfunction
Gautocmdft defx call s:defx_settings()


"" Vista:
let g:vista#renderer#enable_icon = 1
let g:vista_blink = [0, 0]
let g:vista_cursor_delay = 400  " default
let g:vista_default_executive = 'lcn'
let g:vista_disable_statusline = 0
let g:vista_echo_cursor_strategy = 'floating_win'  " echo, scroll, floating_win, both
let g:vista_executive_for = {
      \ 'markdown': 'toc',
      \ }
let g:vista_sidebar_width = '120'

function! s:open_vista(mode)
  if len(a:mode)
    let l:save_vista_default_executive = g:vista_default_executive
    let g:vista_default_executive = a:mode
  endif

  Vista!!
  call timer_start(500, {-> execute('wincmd W')}, {'repeat': 1})

  if get(l:, 'save_vista_default_executive', 0)
    let g:vista_default_executive = l:save_vista_default_executive
  endif
endfunction
command! -nargs=* VistaOpen call s:open_vista(<q-args>)


" Ale:
let g:ale_cache_executable_check_failures = 1
let g:ale_change_sign_column_color = 0
let g:ale_completion_enabled = 0
let g:ale_cursor_detail = 0
let g:ale_echo_cursor = 1
let g:ale_echo_delay = 30
let g:ale_fix_on_save = 0
let g:ale_keep_list_window_open = 0
let g:ale_lint_delay = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_list_window_size = 10
let g:ale_open_list = 0
let g:ale_set_highlights = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_sign_column_always = 1
let g:ale_use_global_executables = 1
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_delay = 20
let g:ale_warn_about_trailing_blank_lines = 1
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_linters = {}
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'markdown': [],
      \ }

" :help ale-other-integration-options
"" CFamily:
let g:ale_c_build_dir_names = ['build', 'bin']
let g:ale_c_parse_compile_commands = 1
let g:ale_c_parse_makefile = 1

function! s:ale_c_cpp_setup() abort
  let s:llvm_bin_directory = '/opt/llvm/devel/bin'

  let s:ale_linters_c_cpp = ['clangd']  " 'clang', 'clangd', 'clangtidy', 'clang-format'
  let s:ale_c_cpp_clangd_executable = s:llvm_bin_directory . '/clang'
  let s:ale_c_cpp_clangd_options = '-all-scopes-completion -clang-tidy -compile_args_from=filesystem -completion-style=detailed -function-arg-placeholders -header-insertion-decorators -include-ineligible-results -input-style=standard -j=12 -pch-storage=memory -static-func-full-module-prefix'
  let s:ale_c_cpp_clangformat_executable = s:llvm_bin_directory . '/clang-format'
  let s:ale_c_cpp_clangtidy_executable = s:llvm_bin_directory . '/clang-tidy'

  " compile_commands.json
  if filereadable(g:c_cpp_root_path . '/build/compile_commands.json')
    let s:ale_c_cpp_clangd_options = s:ale_c_cpp_clangd_options . ' -compile-commands-dir=' . g:c_cpp_root_path . '/build/compile_commands.json'
  elseif filereadable(g:c_cpp_root_path . '/compile_commands.json')
    let s:ale_c_cpp_clangd_options = s:ale_c_cpp_clangd_options . ' -compile-commands-dir=' . g:c_cpp_root_path . '/compile_commands.json'
  endif

  " clangd.dex
  if filereadable(g:c_cpp_root_path . '/build/clangd.dex')
    let s:ale_c_cpp_clangd_options = s:ale_c_cpp_clangd_options . ' -index-file=' . g:c_cpp_root_path . '/build/clangd.dex'
  elseif filereadable(g:c_cpp_root_path . '/compile_commands.json')
    let s:ale_c_cpp_clangd_options = s:ale_c_cpp_clangd_options . ' -index-file=' . g:c_cpp_root_path . '/clangd.dex'
  endif

  """ C:
  let g:ale_linters.c = s:ale_linters_c_cpp
  let g:ale_c_clang_executable = s:llvm_bin_directory . '/clang'
  let g:ale_c_clang_options = '-march=native -std=c17 -Wall'
  let g:ale_c_clangd_executable = s:ale_c_cpp_clangd_executable
  let g:ale_c_clangd_options = s:ale_c_cpp_clangd_options
  let g:ale_c_clangformat_executable = s:ale_c_cpp_clangformat_executable
  let g:ale_c_clangtidy_executable = s:ale_c_cpp_clangtidy_executable

  """ CPP:
  let g:ale_linters.cpp = s:ale_linters_c_cpp
  let g:ale_cpp_clang_executable = s:llvm_bin_directory . '/clang++'
  let g:ale_cpp_clang_options = '-march=native -std=c++17 -Wall'
  let g:ale_cpp_clangd_executable = s:ale_c_cpp_clangd_executable
  let g:ale_cpp_clangd_options = s:ale_c_cpp_clangd_options
  let g:ale_cpp_clangformat_executable = s:ale_c_cpp_clangformat_executable
  let g:ale_cpp_clangtidy_executable = s:ale_c_cpp_clangtidy_executable
endfunction
" Gautocmdft c,cpp,objc,objcpp call s:ale_c_cpp_setup()

let g:ale_linters.c = []
let g:ale_linters.cpp = []

"" Go:
let g:ale_linters.go = []  " let g:ale_linters.go = ['gofmt', 'go vet', 'golint', 'goimports', 'golangci-lint']
" let g:ale_go_gofmt_options = '-s'
" let g:ale_go_govet_options = '-all'
" let g:ale_go_golangci_lint_package = 1

"" Dockerfile:
let g:ale_linters.dockerfile = ['hadolint']
let g:ale_dockerfile_hadolint_use_docker = 'never'

"" Markdown:
let g:ale_linters.markdown = ['textlint']

"" Protobuf:
let g:ale_linters.proto = ['protoc-gen-lint']  " ['prototool', 'protoc-gen-lint']

"" Python:
let g:ale_linters.python = []  " ['flake8', 'pylint', 'pyls'] 'mypy'

"" Rust:
let g:ale_linters.rust = ['cargo']

"" Sh:
let g:ale_linters.sh = ['shellcheck']  " , 'shfmt', 'sh-language-server', 'shell'
let g:ale_sh_shell_default_shell = 'bash'
let g:ale_sh_shellcheck_executable = '/opt/local/bin/shellcheck'
let g:ale_sh_shellcheck_options = '--shell bash'
" let g:ale_sh_shellcheck_exclusions = 'SC1072 SC1090'

"" Terraform:
let g:ale_linters.terraform = ['fmt', 'tflint']
let g:ale_terraform_fmt_executable = 'terraform'
let g:ale_terraform_fmt_options = ''
let g:ale_terraform_tflint_executable = s:gopath . '/bin/tflint'
let g:ale_terraform_tflint_options = '-f json'

"" Yaml:
let g:ale_linters.yaml = ['yamllint']
let g:ale_yaml_yamllint_options = '-s --config-file=' . fnamemodify(findfile('.yamllint', '.;'), ':p')

"" Zsh:
let g:ale_linters.zsh = ['shfmt', 'shell']  " ['shellcheck', 'shfmt']
Gautocmdft zsh let b:ale_sh_shell_default_shell = 'zsh'

Gautocmd User ALELint call lightline#update()


" Caw:
let g:caw_hatpos_skip_blank_line = 0
let g:caw_no_default_keymappings = 1
let g:caw_operator_keymappings = 0


" VimDevIcons:
let g:webdevicons_enable = 1
let g:webdevicons_conceal_nerdtree_brackets = 0
let g:webdevicons_enable_airline_statusline = 0
let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0
let g:webdevicons_enable_airline_tabline = 0
let g:webdevicons_enable_ctrlp = 0
let g:webdevicons_enable_denite = 1
let g:webdevicons_enable_flagship_statusline = 0
let g:webdevicons_enable_flagship_statusline_fileformat_symbols = 0
let g:webdevicons_enable_nerdtree = 0
let g:webdevicons_enable_startify = 0
let g:webdevicons_enable_unite = 0
let g:webdevicons_enable_vimfiler = 0
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1


" LightLine:
" https://donniewest.com/a-guide-to-basic-neovim-plugins
let g:lightline = {}
let g:lightline.colorscheme = 'hybrid'

function! s:quickfix_get_type()
  if exists("*win_getid") && exists("*getwininfo")
    let dict = getwininfo(win_getid())
    if len(dict) > 0 && get(dict[0], 'quickfix', 0) && !get(dict[0], 'loclist', 0)
      return 'QuickFix'
    elseif len(dict) > 0 && get(dict[0], 'quickfix', 0) && get(dict[0], 'loclist', 0)
      return 'LocationList'
    endif
  endif
  redir => buffers
  silent ls
  redir END
  let nr = bufnr('%')
  for buf in split(buffers, '\n')
    if match(buf, '\v^\s*'.nr) > -1
      if match(buf, '\cQuickfix') > -1
        return 'QuickFix'
      else
        return 'LocationList'
      endif
    endif
  endfor
  return ''
endfunction
function! LightlineMode()
  return &buftype ==# 'quickfix' ? s:quickfix_get_type() : lightline#mode()
endfunction
function! LightlineFilename()
  if &buftype ==# 'quickfix'
    return get(w:, "quickfix_title", "")
  endif
  let filename = expand('%:p') !=# '' ? expand('%:p') : '[No Name]'
  " let modified = &modified ? ' +' : ''
  let modified = &modified ? ' +' : &modifiable ? '' : ' -'
  " return filename
  return filename . modified
endfunction
function! LightlineModified()
  hi ModifiedColor guifg=#cf6a4c guibg=#373b41 gui=Bold
  return &modified ? ' +' : &modifiable ? '' : ' -'
endfunction
function! DeviconsGetFileTypeSymbol()
  return strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft'
endfunction
function! DeviconsGetFileFormatSymbol()
  return &fileformat . ' ' . WebDevIconsGetFileFormatSymbol()
endfunction
function! LightlineGitBranch()
  let l:branch_mark = ' '
  if dein#tap('gina.vim')
    let l:branch_mark = '  ' . gina#component#repo#branch()
  endif
  return l:branch_mark
endfunction
function! LightlineNearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

let g:lightline.component = {
      \ 'absolutepath': '%F',
      \ 'bufnum': '%n',
      \ 'charvalue': '%b',
      \ 'charvaluehex': '%B',
      \ 'close': '%999X X ',
      \ 'column': '%c',
      \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
      \ 'filename': '%{LightlineFilename()}',
      \ 'modified': '%{LightlineModified()}',
      \ 'line': '%l',
      \ 'lineinfo': '%3l  %-2v',
      \ 'mode': '%{lightline#mode()}',
      \ 'method': '%{LightlineNearestMethodOrFunction()}',
      \ 'paste': '%{&paste?"PASTE":""}',
      \ 'percent': '%3p%%',
      \ 'percentwin': '%P',
      \ 'readonly': '%R',
      \ 'relativepath': '%f',
      \ 'spell': '%{&spell?&spelllang:""}',
      \ 'winnr': '%{winnr()}',
      \ }
let g:lightline.component_expand = {
      \ 'linter_checking': 'lightline#ale#checking',
      \ 'linter_errors': 'lightline#ale#errors',
      \ 'linter_ok': 'lightline#ale#ok',
      \ 'linter_warnings': 'lightline#ale#warnings',
      \ }
let g:lightline.component_type = {
      \ 'modified': 'raw',
      \ 'linter_checking': 'left',
      \ 'linter_errors': 'error',
      \ 'linter_ok': 'left',
      \ 'linter_warnings': 'warning',
      \ }
let g:lightline.component_function = {
      \ 'mode': 'LightlineMode',
      \ 'fileformat': 'DeviconsGetFileFormatSymbol',
      \ 'filetype': 'DeviconsGetFileTypeSymbol',
      \ 'gitbranch': 'LightlineGitBranch',
      \ }
let g:lightline.active = {
      \ 'left':  [['mode', 'paste'], ['filename', 'gitbranch'], ['method']],
      \ 'right': [[ '', 'lineinfo', 'percent' ], [ '', 'filetype', 'fileformat', 'fileencoding' ], [ 'linter_checking', 'linter_errors', 'linter_warnings'], ['linter_ok']]
      \ }
let g:lightline.inactive = {
      \ 'left':  [[ 'filename' ]],
      \ 'right': [[ 'lineinfo' ], [ 'percent' ]]
      \ }
let g:lightline.tabline = {
      \ 'left':  [[ 'tabs' ]],
      \ 'right': [[ 'close' ]]
      \ }
let g:lightline.tab = {
      \ 'active':   [ 'tabnum', 'filename', 'modified' ],
      \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
      \ }
let g:lightline.enable = { 'statusline': 1 }  " , 'tabline': 1
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '  ' }
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#enable_devicons = 1


"" Gina:
" if dein#source('gina.vim')
"   call gina#custom#command#option('diff', '--opener', 'vsplit')
"   call gina#custom#command#option('commit', '-S')
"   call gina#custom#execute(
"       \ '/\%(commit\)',
"       \ 'setlocal colorcolumn=69 expandtab shiftwidth=2 softtabstop=2 tabstop=2 winheight=40',
"       \)
"   call gina#custom#mapping#nmap(
"       \ '/\%(blame\)',
"       \ 'o', '<Plug>(gina-show-commit)', {'noremap': 0, 'silent': 1},
"       \)
"   call gina#custom#execute(
"       \ '/\%(status\|branch\|ls\|grep\|changes\|tag\)',
"       \ 'setlocal winfixheight',
"       \)
"   call gina#custom#mapping#nmap(
"       \ '/\%(commit\|status\|branch\|ls\|grep\|changes\|tag\)',
"       \ 'q', ':<C-u> q<CR>', {'noremap': 1, 'silent': 1},
"       \)
" endif


" GitGutter:
let g:gitgutter_async = 1
let g:gitgutter_diff_args = ' '
let g:gitgutter_enabled = 1
let g:gItgutter_highlight_lines = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = 100000
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_terminal_reports_focus = 1
let g:gitgutter_sign_added              = '+'
let g:gitgutter_sign_modified           = '~'
let g:gitgutter_sign_removed            = '_'
let g:gitgutter_sign_removed_first_line = '‾'
let g:gitgutter_sign_modified_removed   = '~_'


" Accelerated JK:
let g:accelerated_jk_enable_deceleration = 0
let g:accelerated_jk_acceleration_limit = 500  " 150, 250, 350
let g:accelerated_jk_acceleration_table = [15, 18, 21, 25, 31, 37, 44, 53, 64]  "(1.5*1.2): [12,17,21,24,26,28,30,35], [7,12,17,21,24,26,28,30], [15, 19, 25, 32, 42, 55, 72]


" VimIlluminate:
let g:Illuminate_delay = 250
let g:Illuminate_ftblacklist = ['defx']


" VimHexokinase:
let g:Hexokinase_highlighters = ['backgroundfull']  " 'virtual', 'sign_column', 'background', 'backgroundfull', 'foreground', 'foregroundfull'
" TODO(zchee): not works
"  https://github.com/RRethy/vim-hexokinase/blob/master/plugin/hexokinase.vim
" let s:hexokinase_tmux_colours = {
"      \ '000': '#000000',
"      \ '001': '#800000',
"      \ '002': '#008000',
"      \ '003': '#808000',
"      \ '004': '#000080',
"      \ '005': '#800080',
"      \ '006': '#008080',
"      \ '007': '#c0c0c0',
"      \ '008': '#808080',
"      \ '009': '#ff0000',
"      \ '010': '#00ff00',
"      \ '011': '#ffff00',
"      \ '012': '#0000ff',
"      \ '013': '#ff00ff',
"      \ '014': '#00ffff',
"      \ '015': '#ffffff',
"      \ '016': '#000000',
"      \ '017': '#00005f',
"      \ '018': '#000087',
"      \ '019': '#0000af',
"      \ '020': '#0000d7',
"      \ '021': '#0000ff',
"      \ '022': '#005f00',
"      \ '023': '#005f5f',
"      \ '024': '#005f87',
"      \ '025': '#005faf',
"      \ '026': '#005fd7',
"      \ '027': '#005fff',
"      \ '028': '#008700',
"      \ '029': '#00875f',
"      \ '030': '#008787',
"      \ '031': '#0087af',
"      \ '032': '#0087d7',
"      \ '033': '#0087ff',
"      \ '034': '#00af00',
"      \ '035': '#00af5f',
"      \ '036': '#00af87',
"      \ '037': '#00afaf',
"      \ '038': '#00afd7',
"      \ '039': '#00afff',
"      \ '040': '#00d700',
"      \ '041': '#00d75f',
"      \ '042': '#00d787',
"      \ '043': '#00d7af',
"      \ '044': '#00d7d7',
"      \ '045': '#00d7ff',
"      \ '046': '#00ff00',
"      \ '047': '#00ff5f',
"      \ '048': '#00ff87',
"      \ '049': '#00ffaf',
"      \ '050': '#00ffd7',
"      \ '051': '#00ffff',
"      \ '052': '#5f0000',
"      \ '053': '#5f005f',
"      \ '054': '#5f0087',
"      \ '055': '#5f00af',
"      \ '056': '#5f00d7',
"      \ '057': '#5f00ff',
"      \ '058': '#5f5f00',
"      \ '059': '#5f5f5f',
"      \ '060': '#5f5f87',
"      \ '061': '#5f5faf',
"      \ '062': '#5f5fd7',
"      \ '063': '#5f5fff',
"      \ '064': '#5f8700',
"      \ '065': '#5f875f',
"      \ '066': '#5f8787',
"      \ '067': '#5f87af',
"      \ '068': '#5f87d7',
"      \ '069': '#5f87ff',
"      \ '070': '#5faf00',
"      \ '071': '#5faf5f',
"      \ '072': '#5faf87',
"      \ '073': '#5fafaf',
"      \ '074': '#5fafd7',
"      \ '075': '#5fafff',
"      \ '076': '#5fd700',
"      \ '077': '#5fd75f',
"      \ '078': '#5fd787',
"      \ '079': '#5fd7af',
"      \ '080': '#5fd7d7',
"      \ '081': '#5fd7ff',
"      \ '082': '#5fff00',
"      \ '083': '#5fff5f',
"      \ '084': '#5fff87',
"      \ '085': '#5fffaf',
"      \ '086': '#5fffd7',
"      \ '087': '#5fffff',
"      \ '088': '#870000',
"      \ '089': '#87005f',
"      \ '090': '#870087',
"      \ '091': '#8700af',
"      \ '092': '#8700d7',
"      \ '093': '#8700ff',
"      \ '094': '#875f00',
"      \ '095': '#875f5f',
"      \ '096': '#875f87',
"      \ '097': '#875faf',
"      \ '098': '#875fd7',
"      \ '099': '#875fff',
"      \ '100': '#878700',
"      \ '101': '#87875f',
"      \ '102': '#878787',
"      \ '103': '#8787af',
"      \ '104': '#8787d7',
"      \ '105': '#8787ff',
"      \ '106': '#87af00',
"      \ '107': '#87af5f',
"      \ '108': '#87af87',
"      \ '109': '#87afaf',
"      \ '110': '#87afd7',
"      \ '111': '#87afff',
"      \ '112': '#87d700',
"      \ '113': '#87d75f',
"      \ '114': '#87d787',
"      \ '115': '#87d7af',
"      \ '116': '#87d7d7',
"      \ '117': '#87d7ff',
"      \ '118': '#87ff00',
"      \ '119': '#87ff5f',
"      \ '120': '#87ff87',
"      \ '121': '#87ffaf',
"      \ '122': '#87ffd7',
"      \ '123': '#87ffff',
"      \ '124': '#af0000',
"      \ '125': '#af005f',
"      \ '126': '#af0087',
"      \ '127': '#af00af',
"      \ '128': '#af00d7',
"      \ '129': '#af00ff',
"      \ '130': '#af5f00',
"      \ '131': '#af5f5f',
"      \ '132': '#af5f87',
"      \ '133': '#af5faf',
"      \ '134': '#af5fd7',
"      \ '135': '#af5fff',
"      \ '136': '#af8700',
"      \ '137': '#af875f',
"      \ '138': '#af8787',
"      \ '139': '#af87af',
"      \ '140': '#af87d7',
"      \ '141': '#af87ff',
"      \ '142': '#afaf00',
"      \ '143': '#afaf5f',
"      \ '144': '#afaf87',
"      \ '145': '#afafaf',
"      \ '146': '#afafd7',
"      \ '147': '#afafff',
"      \ '148': '#afd700',
"      \ '149': '#afd75f',
"      \ '150': '#afd787',
"      \ '151': '#afd7af',
"      \ '152': '#afd7d7',
"      \ '153': '#afd7ff',
"      \ '154': '#afff00',
"      \ '155': '#afff5f',
"      \ '156': '#afff87',
"      \ '157': '#afffaf',
"      \ '158': '#afffd7',
"      \ '159': '#afffff',
"      \ '160': '#d70000',
"      \ '161': '#d7005f',
"      \ '162': '#d70087',
"      \ '163': '#d700af',
"      \ '164': '#d700d7',
"      \ '165': '#d700ff',
"      \ '166': '#d75f00',
"      \ '167': '#d75f5f',
"      \ '168': '#d75f87',
"      \ '169': '#d75faf',
"      \ '170': '#d75fd7',
"      \ '171': '#d75fff',
"      \ '172': '#d78700',
"      \ '173': '#d7875f',
"      \ '174': '#d78787',
"      \ '175': '#d787af',
"      \ '176': '#d787d7',
"      \ '177': '#d787ff',
"      \ '178': '#d7af00',
"      \ '179': '#d7af5f',
"      \ '180': '#d7af87',
"      \ '181': '#d7afaf',
"      \ '182': '#d7afd7',
"      \ '183': '#d7afff',
"      \ '184': '#d7d700',
"      \ '185': '#d7d75f',
"      \ '186': '#d7d787',
"      \ '187': '#d7d7af',
"      \ '188': '#d7d7d7',
"      \ '189': '#d7d7ff',
"      \ '190': '#d7ff00',
"      \ '191': '#d7ff5f',
"      \ '192': '#d7ff87',
"      \ '193': '#d7ffaf',
"      \ '194': '#d7ffd7',
"      \ '195': '#d7ffff',
"      \ '196': '#ff0000',
"      \ '197': '#ff005f',
"      \ '198': '#ff0087',
"      \ '199': '#ff00af',
"      \ '200': '#ff00d7',
"      \ '201': '#ff00ff',
"      \ '202': '#ff5f00',
"      \ '203': '#ff5f5f',
"      \ '204': '#ff5f87',
"      \ '205': '#ff5faf',
"      \ '206': '#ff5fd7',
"      \ '207': '#ff5fff',
"      \ '208': '#ff8700',
"      \ '209': '#ff875f',
"      \ '210': '#ff8787',
"      \ '211': '#ff87af',
"      \ '212': '#ff87d7',
"      \ '213': '#ff87ff',
"      \ '214': '#ffaf00',
"      \ '215': '#ffaf5f',
"      \ '216': '#ffaf87',
"      \ '217': '#ffafaf',
"      \ '218': '#ffafd7',
"      \ '219': '#ffafff',
"      \ '220': '#ffd700',
"      \ '221': '#ffd75f',
"      \ '222': '#ffd787',
"      \ '223': '#ffd7af',
"      \ '224': '#ffd7d7',
"      \ '225': '#ffd7ff',
"      \ '226': '#ffff00',
"      \ '227': '#ffff5f',
"      \ '228': '#ffff87',
"      \ '229': '#ffffaf',
"      \ '230': '#ffffd7',
"      \ '231': '#ffffff',
"      \ '232': '#080808',
"      \ '233': '#121212',
"      \ '234': '#1c1c1c',
"      \ '235': '#262626',
"      \ '236': '#303030',
"      \ '237': '#3a3a3a',
"      \ '238': '#444444',
"      \ '239': '#4e4e4e',
"      \ '240': '#585858',
"      \ '241': '#626262',
"      \ '242': '#6c6c6c',
"      \ '243': '#767676',
"      \ '244': '#808080',
"      \ '245': '#8a8a8a',
"      \ '246': '#949494',
"      \ '247': '#9e9e9e',
"      \ '248': '#a8a8a8',
"      \ '249': '#b2b2b2',
"      \ '250': '#bcbcbc',
"      \ '251': '#c6c6c6',
"      \ '252': '#d0d0d0',
"      \ '253': '#dadada',
"      \ '254': '#e4e4e4',
"      \ '255': '#eeeeee',
"      \ }
" function! s:hexokinase_patterns_tmux_colour_process(str) abort
"   if has_key(s:hexokinase_tmux_colours, a:str)
"     return s:hexokinase_tmux_colours[a:str]
"   else
"     return ''
"   endif
" endfunction
" let g:Hexokinase_ft_patterns = {
"      \   'tmux' : {
"      \     'colour{3}': function('s:hexokinase_patterns_tmux_colour_process')
"      \   }
"      \ }


" ParenMatch:
let g:cursorword = 0


" Wakatime:
let g:wakatime_PythonBinary = g:python3_host_prog
let g:wakatime_OverrideCommandPrefix = '/usr/local/share/pipx/wakatime'


" SonicTemplate:
let g:sonictemplate_vim_template_dir = [expand($XDG_CONFIG_HOME.'/nvim/template')]


" Editorconfig:
let g:EditorConfig_core_mode = 'python_external'


" Trans:
let g:trans_lang_credentials_file = $XDG_CONFIG_HOME.'/gcloud/credentials/kouzoh-p-zchee/trans-nvim.json'
let g:trans_lang_locale = 'ja'
let g:trans_lang_output = 'float'  " 'preview'
let g:trans_lang_cutset = ['//', '#']


" OpenBrowser:
let g:openbrowser_search_engines = {
      \ 'google': 'http://google.com/search?q={query}&tbs=qdr:y',
      \ }
let g:openbrowser_message_verbosity = 0


" EasyAlign:
let g:easy_align_ignore_groups = []


" Switchvim:
let g:switch_mapping = ""
let g:switch_custom_definitions = [ [1, 0], ['yes', 'no'], ['ON', 'OFF'], ['static', 'dynamic'], ['v:true', 'v:false'] ]


" ISSW:
Gautocmd InsertLeave,FocusGained * call jobstart('issw com.apple.inputmethod.Kotoeri.Roman', {'detach': v:true})

" Rainbow:
let g:rainbow_active = 0
" let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
" let g:rainbow_load_separately = [
"      \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
"      \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
"      \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
"      \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
"      \ ]

" DiffChar:
let g:DiffUnit = 'Char'  " any single character
let g:DiffColors = 3  " 16 colors in fixed order

" -------------------------------------------------------------------------------------------------
" Language:

" Polyglot:
let g:polyglot_disabled = ['c/c++', 'go', 'cmake']

" Go:
"" NvimGo:
let g:go#build#appengine = v:false
let g:go#build#autosave = v:false
let g:go#build#is_not_gb = v:false
" let g:go#build#flags = ['-tags', 'gojay']
let g:go#build#force = v:false
let g:go#fmt#autosave  = v:true
let g:go#fmt#mode = 'goimports'
" let g:go#fmt#goimports_local = ['github.com/zchee/nvim-lsp']
let g:go#guru#keep_cursor = {
      \ 'callees'    : v:false,
      \ 'callers'    : v:false,
      \ 'callstack'  : v:false,
      \ 'definition' : v:true,
      \ 'describe'   : v:false,
      \ 'freevars'   : v:false,
      \ 'implements' : v:false,
      \ 'peers'      : v:false,
      \ 'pointsto'   : v:false,
      \ 'referrers'  : v:false,
      \ 'whicherrs'  : v:false
      \ }
let g:go#generate#test#subtest = v:true
let g:go#guru#reflection = v:false
let g:go#highlight#cgo = v:true
let g:go#iferr#autosave = v:false
let g:go#lint#golint#autosave = v:false
let g:go#lint#golint#ignore = ['internal', 'vendor', 'pb', 'fbs']
let g:go#lint#golint#mode = 'root'
let g:go#lint#govet#autosave = v:false
let g:go#lint#govet#flags = ['-v', '-all']
let g:go#lint#govet#ignore = ['vendor', 'testdata', '_tmp']
let g:go#lint#metalinter#autosave = v:false
let g:go#lint#metalinter#autosave#tools = ['vet', 'golint']
let g:go#lint#metalinter#deadline = '20s'
let g:go#lint#metalinter#skip_dir = ['internal', 'vendor', 'testdata', '__*.go', '*_test.go']
let g:go#lint#metalinter#tools = ['vet', 'golint']
let g:go#rename#prefill = v:true
let g:go#loaded#gosnippets = v:true
let g:go#terminal#height = 120
let g:go#terminal#start_insert = v:true
let g:go#terminal#width = 150
let g:go#test#all_package = v:false
let g:go#test#autosave = v:false
let g:go#test#flags = ['-v']
let g:go#debug = v:true
let g:go#debug#pprof = v:false
let g:go#loaded#gosnippets = 1
""" highlight
let g:go#highlight#terminal#test               = 1  " default : 0
let g:go_highlight_fold_enable_comment         = 1  " default : 0
let g:go_highlight_generate_tags               = 1  " default : 0
let g:go_highlight_string_spellcheck           = 0  " default : 1
let g:go_highlight_format_strings              = 1  " default : 1
let g:go_highlight_fold_enable_package_comment = 1  " default : 0
let g:go_highlight_fold_enable_block           = 1  " default : 0
let g:go_highlight_import                      = 1  " default : 0
let g:go_highlight_fold_enable_varconst        = 1  " default : 0
let g:go_highlight_array_whitespace_error      = 0  " default : 1
let g:go_highlight_trailing_whitespace_error   = 0  " default : 1
let g:go_highlight_chan_whitespace_error       = 0  " default : 1
let g:go_highlight_extra_types                 = 0  " default : 1
let g:go_highlight_space_tab_error             = 0  " default : 1
let g:go_highlight_operators                   = 1  " default : 0
let g:go_highlight_functions                   = 1  " default : 0
let g:go_highlight_function_parameters         = 0  " default : 0
let g:go_highlight_function_calls              = 1  " default : 0
let g:go_highlight_fields                      = 0  " default : 0
let g:go_highlight_types                       = 0  " default : 0
let g:go_highlight_variable_assignments        = 0  " default : 0
let g:go_highlight_variable_declarations       = 0  " default : 0
let g:go_highlight_build_constraints           = 1  " default : 0

" C CXX:
let c_no_curly_error = 1
"" VimCPPModern:
let g:cpp_simple_highlight = 1  " Put all standard C and C++ keywords under Vim's highlight group `Statement` (affects both C and C++ files)
let g:cpp_named_requirements_highlight = 1  " Enable highlighting of named requirements (C++20 library concepts)

"" Chromatica:
" automatically starts C family filetypes
" Gautocmdft c,cpp,objc,objcpp ChromaticaStart
" let g:chromatica#enable_at_startup = 1
" let g:chromatica#libclang_path = s:llvm_base_path . '/lib/libclang.dylib'
let g:chromatica#libclang_path = $XCODE_PATH . '/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
let g:chromatica#enable_log = 0
let g:chromatica#enable_profiling = 0
let g:chromatica#global_args = [
      \ '-I' . $XCODE_PATH . '/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1',
      \ '-isystem' . $XCODE_PATH . '/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/' . s:llvm_clang_version . '/include',
      \ '-isysroot/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk',
      \ '-mmacosx-version-min=10.15',
      \ '-F/System/Library/Frameworks',
      \ '-F/System/Library/PrivateFrameworks',
      \ '-F/Library/Developer/CommandLineTools/Library/Frameworks',
      \ '-F/Library/Developer/CommandLineTools/Library/PrivateFrameworks',
      \ '-F' . $XCODE_PATH . '/Contents/Applications/Instruments.app/Contents/Frameworks',
      \ '-F/System/DriverKit/System/Library/Frameworks',
      \ '-F/usr/local/Frameworks',
      \ '-I' . $XCODE_PATH . '/lib',
      \ '-I/usr/local/lib',
      \ ]
      "\ '-I' . s:llvm_base_path . '/include/c++/v1',
      "\ '-isystem' . s:llvm_base_path . '/lib/clang/' . s:llvm_clang_version . '/include',
      "\ '-I' . s:llvm_base_path . '/lib',
" let g:chromatica#global_args = ['-I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++ -isystem/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.1/include']
" let g:chromatica#libclang_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
let g:chromatica#responsive_mode = 0
let g:chromatica#delay_ms = 30
let g:chromatica#use_pch = 1
let g:chromatica#highlight_feature_level = 1
let g:chromatica#debug_log = 0
let g:chromatica#dotclangfile_search_path = ''


" Python:
"" Kite:
let g:kite_auto_complete = 1
let g:kite_snippets = 0
let g:kite_tab_complete = 0
let g:kite_deconflict_cr = 1

"" Semshi:
let g:semshi#mark_selected_nodes = 0


" Asm:
let g:nasm_loose_syntax = 1
let g:nasm_ctx_outside_macro = 1


" Rust:
let g:rust_bang_comment_leader = 1
let g:rust_clip_command = 'pbcopy'
let g:rust_conceal = 0
let g:rust_conceal_mod_path = 0
let g:rust_conceal_pub = 0
let g:rust_fold = 1
let g:rust_playpen_url = 'https://play.rust-lang.org/'
let g:rust_recommended_style = 0
let g:rust_shortener_url = 'https://is.gd/'
let g:rustc_makeprg_no_percent = 1
let g:rustc_path = '/usr/local/rust/cargo/bin/rustc'
let g:rustfmt_autosave = 0
let g:rustfmt_autosave = 1
let g:rustfmt_command = '/usr/local/rust/cargo/bin/rustfmt'
let g:rustfmt_command = 'rustfmt'
let g:rustfmt_fail_silently = 1


"" Lua:
let g:lua_check_syntax = 0
let g:lua_complete_omni = 1
let g:lua_complete_dynamic = 0
let g:lua_define_completion_mappings = 0

"" Terraform:
let g:terraform_commentstring = '//%s'
let g:terraform_fmt_on_save = 1


"" Yaml:


"" TypeScript:
let g:yats_host_keyword = 1


"" Binary:
let g:vinarise_enable_auto_detect = 1
if isdirectory('/usr/local/opt/binutils')
  let g:vinarise_objdump_command = '/usr/local/opt/binutils/bin/gobjdump'
endif


"" Markdown:
"" VimMarkdownfmt:
let g:markdownfmt_command = 'markdownfmt'
let g:markdownfmt_options = ''
let g:markdownfmt_autosave = 0
let g:markdownfmt_fail_silently = 0

"" MarkdownPreview:
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_markdown_css = $XDG_CONFIG_HOME . '/nvim/plugin/markdown-preview.nvim/github.css'
" let g:mkdp_highlight_css = $XDG_CONFIG_HOME . '/nvim/plugin/markdown-preview.nvim/highlight.css'

function! s:markdown_preview_forcus_gain()
  call mkdp#util#open_preview_page()
  call timer_start(700, {-> system('kitty @ focus-window')}, {'repeat': 1})
endfunction
command! -nargs=* MarkdownPreviews call s:markdown_preview_forcus_gain()


"" PlantUML:
let g:plantuml_previewer#plantuml_jar_path = '/usr/local/opt/plantuml/libexec/plantuml.jar'
let g:plantuml_previewer#viewer_path = '/tmp/plantuml'

"" NvimLSP:
" luado require'nvim_lsp'.gopls.setup{"cmd={ s:gopath . '/bin/gopls -logfile /tmp/gopls-nvimlsp.log -rpc.trace serve' }"}
      "\ cmd = { s:gopath . '/bin/gopls', '-logfile', '/tmp/gopls-nvimlsp.log', '-rpc.trace', 'serve' },
      "\ log_level = 0,
      "\ settings = {
      "\   "completionDocumentation": true,
      "\   "usePlaceholders": true,
      "\   "deepCompletion": true,
      "\   "completeUnimported": false,
      "\   "matcher": "fuzzy",
      "\   "hoverKind": "FullDocumentation",
      "\   "staticcheck": false,
      "\   "verboseOutput": true,
      "\   "tempModfile": false
      "\ },
      "\}

" -------------------------------------------------------------------------------------------------
" Previous use plugins

"" VimGo:
" let g:go_asmfmt_autosave = 0
" let g:go_auto_type_info = 0
" let g:go_autodetect_gopath = 0
" let g:go_def_mapping_enabled = 0
" let g:go_def_mode = 'godef'
" " let g:go_doc_command = 'godoc'
" let g:go_doc_max_height = 30
" " let g:go_doc_options = ''
" let g:go_fmt_autosave = 0
" let g:go_fmt_command = 'goimports'
" let g:go_fmt_experimental = 1
" " let g:go_loclist_height = 15
" " let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'gotype']
" let g:go_snippet_engine = 'neosnippet'
" let g:go_template_enabled = 0
" let g:go_term_enabled = 1
" let g:go_term_height = 30
" let g:go_term_width = 30

" Airline:
" let g:airline#extensions#ale#enabled = 1
" let g:airline#extensions#ale#error_symbol = 'E:'
" let g:airline#extensions#ale#warning_symbol = 'W:'
" let g:airline#extensions#ale#show_line_numbers = 1
" let g:airline#extensions#ale#open_lnum_symbol = '(L'
" let g:airline#extensions#ale#close_lnum_symbol = ')'
" let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#branch#custom_head = 'gina#component#repo#branch'
" let g:airline#extensions#bufferline#enabled = 1
" let g:airline#extensions#bufferline#overwrite_variables = 0
" let g:airline#extensions#cursormode#enabled = 0
" let g:airline#extensions#hunks#enabled = 0
" let g:airline#extensions#keymap#enabled = 1
" let g:airline#extensions#languageclient#enabled = 0
" let g:airline#extensions#quickfix#location_text = 'Location'
" let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline#extensions#tabline#buffers_label = 'b'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#exclude_preview = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#show_buffers = 0
" let g:airline#extensions#tabline#show_splits = 1
" let g:airline#extensions#tabline#show_tab_nr = 0
" let g:airline#extensions#tabline#show_tab_type = 1
" let g:airline#extensions#tabline#show_tabs = 1
" let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
" let g:airline#extensions#tabline#tab_nr_type = 2
" let g:airline#extensions#tabline#tabs_label = 't'
" let g:airline#extensions#tagbar#enabled = 0
" let g:airline#extensions#whitespace#mixed_indent_algo = 2
" let g:airline#extensions#wordcount#enabled = 0
" let g:airline_exclude_filetypes = ['fzf']
" let g:airline_highlighting_cache = 1
" let g:airline_inactive_collapse = 0
" let g:airline_powerline_fonts = 1
" let g:airline_skip_empty_sections = 1
" let g:airline_theme = 'hybridline'
" if dein#is_sourced('vim-airline')
"   let g:airline_section_c = airline#section#create(['%<', 'readonly', '%{expand(''%:p'')}'])
" endif
"

"" VimAutoPep8:
" let g:autopep8_aggressive = 2
" let g:autopep8_disable_show_diff = 1
" let g:autopep8_max_line_length = 99
"

" YouCompleteMe:
" let g:ycm_auto_trigger = 1
" let g:ycm_min_num_of_chars_for_completion = 1
" let g:ycm_filetype_blacklist = {
"      \ 'tagbar' : 1,
"      \ 'pandoc' : 1,
"      \ 'quickrun' : 1,
"      \ 'markdown' : 1,
"      \}
" let g:ycm_always_populate_location_list = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_complete_in_comments = 1
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_extra_conf_globlist = ['./*','../*']
" let g:ycm_filepath_completion_use_working_dir = 1
" let g:ycm_global_ycm_extra_conf = $XDG_CONFIG_HOME.'/nvim/.ycm_extra_conf.py'
" let g:ycm_goto_buffer_command = 'same-buffer'  " ['same-buffer', 'horizontal-split', 'vertical-split', 'new-tab', 'new-or-existing-tab']
" let g:ycm_key_list_select_completion = ['<Down>']
" let g:ycm_key_list_previous_completion = ['<Up>']
" let g:ycm_server_python_interpreter = g:python_host_prog
" let g:ycm_python_binary_path = g:python_host_prog
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_use_clangd = 1


"" Rtags:
" let g:rtagsJumpStackMaxSize = 1000
" let g:rtagsMaxSearchResultWindowHeight = 15
" let g:rtagsMinCharsForCommandCompletion = 100
" let g:rtagsUseDefaultMappings = 0
" let g:rtagsUseLocationList = 1


" Vaffle:
" let g:vaffle_auto_cd = 1
" let g:vaffle_force_delete = 1
" let g:vaffle_show_hidden_files = 1
" let g:vaffle_use_default_mappings = 1


" NERDTree:
" let g:NERDTreeAutoDeleteBuffer = 1
" let g:NERDTreeDirArrowCollapsible = '▼'
" let g:NERDTreeDirArrowExpandable  = '▶'
" let g:NERDTreeDirArrows = 1
" let g:NERDTreeHijackNetrw = 0
" let g:NERDTreeMinimalUI = 1
" let g:NERDTreeMouseMode = 1
" let g:NERDTreeQuitOnOpen = 1
" let g:NERDTreeRespectWildIgnore = 1
" let g:NERDTreeShowHidden = 1
" let g:NERDTreeSortHiddenFirst = 1

" -------------------------------------------------------------------------------------------------
" Functions:

" Filetye:
" `a:args` should be list
function! s:is_filetype(args)
  let l:ft = &filetype
  " let l:ft = getbufvar(winbufnr(winnr()), "&filetype")
  if (index(a:args, l:ft) >= 0)
    return v:true
  endif
  return v:false
endfunction


" Help:
" https://github.com/rhysd/dotfiles/blob/master/nvimrc#L380-L405
function! s:smart_help(args)
  if winwidth(0) > winheight(0) * 2
    let l:help_args = 'vertical rightbelow help ' . a:args
  else
    let l:help_args = 'rightbelow help ' . a:args
  endif

  try
    execute l:help_args
  catch /^Vim\%((\a\+)\)\=:E149/
    echohl ErrorMsg
    echomsg "E149: Sorry, no help for " . a:args
    echohl None
  endtry
endfunction
command! -nargs=* -complete=help Help call s:smart_help(<q-args>)

" HelpGrep:
function! s:smart_helpgrep(args)
  if winwidth(0) > winheight(0) * 2
    let l:help_args = 'vertical rightbelow helpgrep ' . a:args
  else
    let l:help_args = 'rightbelow helpgrep ' . a:args
  endif

  try
    execute l:help_args
  catch /^Vim\%((\a\+)\)\=:E149/
    echohl ErrorMsg
    echomsg "E149: Sorry, no help for " . a:args
    echohl None
  endtry

  silent! copen
endfunction
command! -nargs=* -complete=help HelpGrep call s:smart_helpgrep(<q-args>)


" SyntaxInfo:
" Display syntax infomation on under the current cursor
" for syntax ID
function! s:get_syn_id(transparent)
  let s:synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(s:synid)
  else
    return s:synid
  endif
endfunction
" for syntax attributes
function! s:get_syn_attr(synid)
  let s:name = synIDattr(a:synid, "name")
  let s:bold  = synIDattr(a:synid, "bold", "gui")
  let s:guifg = synIDattr(a:synid, "fg", "gui")
  let s:guibg = synIDattr(a:synid, "bg", "gui")
  let s:guisp = synIDattr(a:synid, "sp")
  let s:attr = {
        \ "name": s:name,
        \ "bold": s:bold,
        \ "guifg": s:guifg,
        \ "guibg": s:guibg,
        \ "guisp": s:guisp,
        \ }
  return s:attr
endfunction
" return syntax information
function! s:get_syn_info(cword)
  let s:baseSyn = s:get_syn_attr(s:get_syn_id(0))
  let s:baseSynInfo = "name: " . s:baseSyn.name .
        \ " bold: " . (s:baseSyn.bold == 1 ? 'true' : 'false' ) . "," .
        \ " guifg: " . s:baseSyn.guifg . "," .
        \ " guibg: " . s:baseSyn.guibg . "," .
        \ " guisp: " . s:baseSyn.guisp
  let s:linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  let s:linkedSynInfo =  "name: " . s:linkedSyn.name .
        \ " bold: " .  (s:linkedSyn.bold == 1 ? 'true' : 'false' ) . "," .
        \ " guifg: " . s:linkedSyn.guifg . "," .
        \ " guibg: " . s:linkedSyn.guibg . "," .
        \ " guisp: " . s:linkedSyn.guisp
  echomsg a:cword . ':'
  echomsg s:baseSynInfo
  echomsg '  ' . "link to"
  echomsg s:linkedSynInfo
endfunction
command! SyntaxInfo call s:get_syn_info(expand('<cword>'))


" ClearMessage:
command! ClearMessage for n in range(200) | echom "" | endfor


" Binary Edit Mode:
" need open nvim with `-b` flag
function! BinaryMode() abort
  if !has('binary')
    echoerr "BinaryMode must be 'binary' option"
    return
  endif

  execute '%!xxd'
endfunction


" Profiling Syntax:
function! ProfileSyntax() abort
  " Initial and cleanup syntime
  redraw!
  syntime clear
  " Profiling syntax regexp
  syntime on
  redraw!
  QuickRun -type vim -src 'syntime report'
endfunction


" Open the C/C++ online document
" https://github.com/rhysd/dogfiles/blob/926f2b9c1856bbf3a8090f430831f2c94d7cc410/vimrc#L1399-L1423
function! s:open_online_cfamily_doc()
  call dein#source('open-browser.vim')
  let l:l = getline('.')

  if l:l =~# '^\s*#\s*include\s\+<.\+>'
    let l:header = matchstr(l, '^\s*#\s*include\s\+<\zs.\+\ze>')
    if header =~# '^boost'
      "https://www.google.co.jp/search?hl=en&as_q=int64_max&as_sitesearch=cpprefjp.github.io
      execute 'OpenBrowser' 'http://www.google.com/cse?cx=011577717147771266991:jigzgqluebe&q='.matchstr(header, 'boost/\zs[^/>]\+\ze')
      return
    else
      execute 'OpenBrowser' 'http://ja.cppreference.com/mwiki/index.php?title=Special:Search&search='.matchstr(header, '\zs[^/>]\+\ze')
      return
    endif
  else
    let l:cword = expand('<cword>')
    if cword ==# ''
      return
    endif
    let l:line_head = getline('.')[:col('.')-1]
    if line_head =~# 'boost::[[:alnum:]:]*$'
      execute 'OpenBrowser' 'http://www.google.com/cse?cx=011577717147771266991:jigzgqluebe&q='.l:cword
    elseif line_head =~# 'std::[[:alnum:]:]*$'
      execute 'OpenBrowser' 'https://www.google.co.jp/search?hl=en&as_sitesearch=cpprefjp.github.io&as_q='.l:cword
      execute 'OpenBrowser' 'http://ja.cppreference.com/mwiki/index.php?title=Special:Search&search='.l:cword
    else
      let l:name = synIDattr(synIDtrans(synID(line("."), col("."), 1)), 'name')
      if l:name == 'Statement'
        execute 'OpenBrowser' 'http://ja.cppreference.com/w/c/language/'.l:cword
      else
        execute 'OpenBrowser' 'http://ja.cppreference.com/mwiki/index.php?title=Special:Search&search='.l:cword
      endif
    endif
  endif
endfunction


" Trim Whitespace:
function! s:trimSpace()
  if !&binary && &filetype != 'diff' && &filetype != 'markdown'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
command! TrimSpace call s:trimSpace()


" EditInit:
function! s:editTnit()
  vsplit $XDG_CONFIG_HOME/nvim/init.vim
endfunction
command! EditInit call s:editTnit()


" Lr:
" <lr-args> to browse lr(1) results in a new window, press return to open file in new window.
command! -nargs=* -complete=file Lr
      \ new | setl bt=nofile noswf | silent exe '0r!lr -Q ' <q-args> |
      \ 0 | res | map <buffer><C-M> $<C-W>F<C-W>_


" LSPYamlSetSchema:
function! s:lsp_set_schema(args)
  if &filetype !=? "yaml" || !len(a:args)
    return
  endif

  let l:filepath = expand('%:p')
  let l:filename = fnamemodify(l:filepath, ':t')

  let l:schema = a:args
  let l:config_file = expand($XDG_CONFIG_HOME . '/nvim/lsp/yaml/' . l:schema . '.json')
  let l:config = json_decode(readfile(l:config_file))

  echom 'yaml-language-server: schema: ' . l:schema . ', config_file: ' . l:config_file
  call LanguageClient#Notify('workspace/didChangeConfiguration', { 'settings': l:config })
endfunction
command! -nargs=* LSPYamlSetSchema call <SID>lsp_set_schema(<q-args>)

" -------------------------------------------------------------------------------------------------
" Command:

" CheckColor:
function s:check_colorscheme() abort
  Capture call nvim_command("edit ~/.nvim/colors/hybrid.vim | source $VIMRUNTIME/tools/check_colors.vim")
  wincmd x
  setlocal filetype=vim
endfunction

command! CheckColorScheme call s:check_colorscheme()

" Terminal:
command! -nargs=* Terminal split | terminal <args>
command! -nargs=* TerminalV vsplit | terminal <args>

" Capture:
" http://qiita.com/sgur/items/9e243f13caa4ff294fa8
command! -nargs=+ -complete=command Capture QuickRun -type vim -src <q-args>

" Shfmt:
command! -nargs=0 -bang -complete=command Shfmt %!shfmt -i 2

" FormatJson:
if has("python3")
python3 << EOF
import vim
import json
def Format_Json(indent, sort):
    jsonStr = "\n".join(vim.current.buffer)
    prettyJson = json.dumps(json.loads(jsonStr), sort_keys=sort, indent=indent, separators=(',', ': '), ensure_ascii=False)
    prettyJson = prettyJson.encode('utf8')
    vim.current.buffer[0:] = prettyJson.split(b'\n')

def Format_Json_Select(start, end):
    start = start - 1
    jsonStr = "\n".join(vim.current.buffer[start:end])
    prettyJson = json.dumps(json.loads(jsonStr), sort_keys=False, indent=2, separators=(',', ': '), ensure_ascii=False)
    prettyJson = prettyJson.encode('utf8')
    vim.current.buffer[start:end] = prettyJson.split(b'\n')

def Format_JsonSchema(indent, sort):
    jsonStr = "\n".join(vim.current.buffer)
    prettyJson = json.dumps(json.loads(jsonStr), sort_keys=sort, indent=indent, separators=(',', ': '), ensure_ascii=False)
    prettyJson = prettyJson.encode('utf8')
    vim.current.buffer[0:] = prettyJson.split(b'\n')

def Format_JsonSchema_Select(start, end):
    start = start - 1
    jsonStr = "\n".join(vim.current.buffer[start:end])
    prettyJson = json.dumps(json.loads(jsonStr), sort_keys=False, indent=2, separators=(',', ': '), ensure_ascii=False)
    prettyJson = prettyJson.encode('utf8')
    vim.current.buffer[start:end] = prettyJson.split(b'\n')
EOF
  command! -bang -bar -complete=command -nargs=* -range=% FormatJson :python3 Format_Json(<args>)
  command! -bang -bar -complete=command -nargs=* -range=% FormatJsonSelect :python3 Format_Json_Select(<line1>, <line2>)

  command! -bang -bar -complete=command -nargs=* -range=% FormatJsonSchema :python3 Format_JsonSchema(<args>)
  command! -bang -bar -complete=command -nargs=* -range=% FormatJsonSchemaSelect :python3 Format_JsonSchema_Select(<line1>, <line2>)
else
  command! -nargs=0 -bang -complete=command FormatJson %!python3 -m json.tool
endif

" ProfileSyntax:
command! -nargs=0 -bang -complete=command ProfileSyntax call ProfileSyntax()

" from https://github.com/justinmk/config/blob/master/.config/nvim/init.vim
command! ConvertBlockComment keeppatterns .,/\*\//s/\v^((\s*\/\*)|(\s*\*\/)|(\s*\*))(.*)/\/\/\/\5/
command! StartuptimeNvim     execute "v:progpath . ' --startuptime ' . expand('~/vimprofile.txt') '-c \"e ~/vimprofile.txt\"'"
function! Cxn_py() abort
  vsplit
  terminal
  call chansend(&channel, "python3\nimport pynvim\n")
  call chansend(&channel, "n = pynvim.attach('socket', path='".g:cxn."')\n")
endfunction
function! Cxn(addr) abort
  silent! unlet g:cxn
  tabnew
  if !empty(a:addr)  " Only start the client.
    let g:cxn = a:addr
    call Cxn_py()
    return
  endif

  terminal
  let nvim_path = executable('build/bin/nvim') ? 'build/bin/nvim' : 'nvim'
  call chansend(&channel, "NVIM_LISTEN_ADDRESS= ".nvim_path." -u NORC\n")
  call chansend(&channel, ":let j=jobstart('nc -U ".v:servername."',{'rpc':v:true})\n")
  call chansend(&channel, ":call rpcrequest(j, 'nvim_set_var', 'cxn', v:servername)\n")
  call chansend(&channel, ":call rpcrequest(j, 'nvim_command', 'call Cxn_py()')\n")
endfunction
command! -nargs=* NvimCxn call Cxn(<q-args>)

" -------------------------------------------------------------------------------------------------
" Keymap:
"
" For Kinesis Advantage With Programmer Dvorak.
" Global & Local MapLeader are arranged in the center of the keyboard.
"
"   - Global MapLeader: <Space> " Righthand
"   - Local MapLeader : <BS>    " Lefthand
"   - Local prefix    : ,       " Lefthand
"
" TODO(zchee):
"   Swaps semicolon and colon to ideal at Kinesis hardware level. Now use direct edited macOS key dictionary
"   Use Kinesis Advantage2 instead of.
"
" Vim remappable keys
"   - <Space>
"   - ,       : Reverse repeat for f, t, F, T
"   - s       : replace to cl
"   - t       : Never use it in normal mode, f -> ... -> h instead of
"   - m       : For sets marker, never use it also
"
"   - http://deris.hatenablog.jp/entry/2013/05/02/192415
"
" -------------------------------------------------------------------------------------------------
" Map Leader:

" nmap <Nop> for g:mapleader and g:maplocalleader keys
nnoremap <nowait><Space> <Nop>
nnoremap <nowait><BS>    <Nop>
if !exists('g:mapleader')
  let g:mapleader = "\<Space>"
endif
if !exists('g:maplocalleader')
  let g:maplocalleader = "\<BS>"
endif

"" <Leader>
nnoremap              <Leader>ga        :<C-u>Gina add %<CR>
nnoremap              <Leader>gc        :<C-u>Gina commit<CR>
nnoremap              <Leader>gp        :<C-u>Gina push<CR>
nnoremap              <Leader>gs        :<C-u>Gina status<CR>

"" <LocalLeader>
nnoremap <silent><LocalLeader>*         :<C-u>DeniteCursorWord grep -buffer-name='grep/rg'<CR>
nnoremap <silent><LocalLeader>-         :<C-u>split<CR>
nnoremap <silent><LocalLeader>\         :<C-u>vsplit<CR>
nnoremap <silent><LocalLeader>b         :<C-u>Denite buffer -buffer-name='buffer'<CR>
nnoremap <silent><LocalLeader>g         :<C-u>Denite line -buffer-name='line'<CR>
nnoremap <silent><LocalLeader>gs        :<C-u>call switch#Switch()<CR>
nnoremap <silent><LocalLeader>q         :<C-u>q<CR>
nnoremap <silent><LocalLeader>w         :<C-u>w<CR>

"" ,
nnoremap              <silent>,m        <C-w>W
nnoremap              <silent>,n        <C-w>w
nnoremap              <silent>,p        <C-w>W
nnoremap              <silent>,r        <C-w>x
nnoremap              <silent>,s        :<C-u>bNext<CR>
nnoremap              <silent>,t        :<C-u>tabnew<CR>
nnoremap              <silent>,w        <C-w>w

" -------------------------------------------------------------------------------------------------
" Map: (m)

"" Operator:
map <silent>ti  <Plug>(operator-surround-append)
map <silent>td  <Plug>(operator-surround-delete)
map <silent>tr  <Plug>(operator-surround-replace)

" -------------------------------------------------------------------------------------------------
" Normal: (n)

"        *) asterisk-gz*
"        -) 'Vaffle %:p:h' or 'VimFilerExplorer -find<CR>'
"      @,^) ^,@: switch '@' and '^' for Dvorak pinky
"       ga) EasyAlign
"       gx) openbrowser-smart-search
"        j) accelerated_jk_gj_position
"        k) accelerated_jk_gk_position
"        p) Paste
"        Q) gq: do not use Ex mode. Use 'gq' is the format the lines that {motion} moves over
"        s) A: Append text at the end of the line [count] times
"        x) "_x: do not add yank register
"       zj)       zjzt
"       zk)       2zkzjzt
"       ZQ) <Nop>: disable suspend
"    <C-g>) 'DeniteProjectDir grep'
"    <C-p>) 'DeniteProjectDir file_rec'
"    <C-q>) nohlsearch: Stop the highlighting for the 'hlsearch' option
" <S-Tab>>) %: Jump to match pair brackets. *<Tab>* and *<C-i>* are similar treatment.
"              Note that needs <C-i>(<Tab>) for jump to next taglist
" <S-Down>) <Nop>
"   <S-Up>) <Nop>

nmap <silent><nowait>*       <Plug>(asterisk-gz*)
nnoremap <silent>-           :<C-u>Defx -auto-cd -direction=topleft -split=vertical -search=`expand('%:p')` `expand('%:p:h')`<CR>
nnoremap <nowait>@           ^
nnoremap <nowait>^           @
nmap             ga          <Plug>(LiveEasyAlign)
nnoremap <silent>gs          :<C-u>Switch<CR>
nmap       <silent>gx        <Plug>(openbrowser-smart-search)
nmap <silent><nowait>j       <Plug>(accelerated_jk_j)
nmap <silent><nowait>k       <Plug>(accelerated_jk_k)
" nmap     <nowait>j           <Plug>(accelerated_jk_gj)
" nmap     <nowait>k           <Plug>(accelerated_jk_gk)

nnoremap         Q           gq
nnoremap         s           A
nnoremap <nowait>x           "_x
nnoremap         zj          zjzt
nnoremap         zk          2zkzjzt
nnoremap         ZQ          <Nop>
" nnoremap <silent><C-o>       <C-o>zz
nmap             <C-w>z      <Plug>(zoom-toggle)
nnoremap <silent><C-g>       :<C-u>DeniteBufferDir grep -buffer-name='grep' -path=`expand('%:p:h')`<CR>
nnoremap <silent><C-p>       :<C-u>DeniteProjectDir file/rec -buffer-name='file_rec/fd' -start-filter -path=`expand('%:p')`<CR>
nnoremap <silent><C-q>       :<C-u>nohlsearch<CR>
" nnoremap <silent><C-w><C-r>  <C-w>r<C-w>x
nnoremap <nowait><Up>        <Up>
nnoremap <nowait><Down>      <Down>
nnoremap         <S-Tab>     %
nnoremap         <S-Down>    <Nop>
nnoremap         <S-Up>      <Nop>

nnoremap <C-y> <C-y><C-y><C-y><C-y>
nnoremap <C-e> <C-e><C-e><C-e><C-e>


" Language:

"" Go:
" Gautocmdft go nnoremap  <silent><buffer><LocalLeader>]    :<C-u>call GoGuru('definition')<CR>
""" normal
""" <Leader>
" Gautocmdft go nmap  <silent><buffer><Leader>e             <Plug>(nvim-go-rename)
""" <LocalLeader>
" Gautocmdft go nmap  <silent><buffer><LocalLeader>gc       <Plug>(nvim-go-callers)
" Gautocmdft go nmap  <silent><buffer><LocalLeader>gcs      <Plug>(nvim-go-callstack)
" Gautocmdft go nmap  <silent><buffer><LocalLeader>ge       <Plug>(nvim-go-callees)
" Gautocmdft go nmap  <silent><buffer><LocalLeader>gs       <Plug>(nvim-go-switch-test)
" Gautocmdft go nmap  <silent><buffer><LocalLeader>i        <Plug>(nvim-go-iferr)
" Gautocmdft go nmap  <silent><buffer><LocalLeader>l        <Plug>(nvim-go-lint)
" Gautocmdft go nmap  <silent><buffer><LocalLeader>m        <Plug>(nvim-go-metalinter)
" Gautocmdft go nmap  <silent><buffer><LocalLeader>r        <Plug>(nvim-go-run)
" Gautocmdft go nmap  <silent><buffer><LocalLeader>t        <Plug>(nvim-go-test)
" Gautocmdft go nmap  <silent><buffer><LocalLeader>v        <Plug>(nvim-go-vet)
Gautocmd BufNewFile,BufRead,BufEnter godoc://** nmap <C-]> <CR>

function! s:languageclient_definition(...)
  if len(a:000) == 0
    call LanguageClient#textDocument_definition()
  else
    call LanguageClient#textDocument_definition(a:1)
  endif
  normal! zz
endfunction
function! s:languageclient_typeDefinition(...)
  if len(a:000) == 0
    call LanguageClient#textDocument_typeDefinition()
  else
    call LanguageClient#textDocument_typeDefinition(a:1)
  endif
  normal! zz
endfunction

function! s:languageclient_setup()
  setlocal formatexpr=LanguageClient#textDocument_rangeFormatting()
  nnoremap <silent><buffer><C-]>            :<C-u>call <SID>languageclient_definition()<CR>
  nnoremap <silent><buffer><C-]>v           :<C-u>call <SID>languageclient_definition({'gotoCmd': 'vsplit'})<CR>
  nmap     <silent><buffer><C-t>            :<C-u>call <SID>languageclient_typeDefinition()<CR>
  nnoremap <silent><buffer><Leader>e        :<C-u>call LanguageClient#textDocument_rename()<CR>
  nnoremap <silent><buffer>K                :<C-u>call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent><buffer><LocalLeader>ds  :<C-u>call LanguageClient#textDocument_documentSymbol()<CR>

  let g:lsp_settings_path = json_decode(readfile($XDG_CONFIG_HOME . '/nvim/lsp/settings.json'))
  if &filetype == 'go'
    let g:lsp_settings_path = json_decode(readfile($XDG_CONFIG_HOME . '/nvim/lsp/gopls'))
  endif
  Gautocmd User LanguageClientTextDocumentDidOpenPost call LanguageClient#Notify('workspace/didChangeConfiguration', { 'settings': g:lsp_settings_path })  " workspace/configuration, workspace/didChangeConfiguration
endfunction
" TODO: Gautocmdft join(keys(g:LanguageClient_serverCommands), ',') call s:languageclient_setup()
Gautocmdft c,cpp,dockerfile,java,javascript,json,jsonc,lua,objc,proto,python,ruby,sh,swift,yaml,typescript call s:languageclient_setup()

if dein#tap('nvim-lsp')
  function! s:nvim_lsp_setup()
    " setlocal formatexpr=LanguageClient#textDocument_rangeFormatting()
    nmap     <nowait><silent><buffer><C-]>      <Plug>(nvim-lsp-textdocument-definition)
    nmap     <nowait><silent><buffer>K          <Plug>(nvim-lsp-textdocument-hover)
    nnoremap <silent><buffer><LocalLeader>gh    :<C-u>call LanguageClient#textDocument_signatureHelp()<CR>
    nnoremap <silent><buffer><LocalLeader>gdh   :<C-u>call LanguageClient#textDocument_documentHighlight()<CR>
    nmap     <silent><buffer><LocalLeader>gi    <Plug>(nvim-lsp-textdocument-implementation)
    nmap     <silent><buffer><LocalLeader>gr    <Plug>(nvim-lsp-textdocument-references)
    nmap     <silent><buffer><LocalLeader>gs    <Plug>(nvim-lsp-textdocument-symbol)
    nmap     <silent><buffer><LocalLeader>gt    <Plug>(nvim-lsp-textdocument-typedefinition)

    nnoremap <silent><buffer>v<C-]>             :<C-u>call LSPTextDocumentDefinition('vsplit')<CR>
    nnoremap <nowait><silent><buffer><Leader>e  :<C-u>call LanguageClient#textDocument_rename()<CR>
    nnoremap <nowait><silent><buffer><Leader>k  :<C-u>call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent><buffer><LocalLeader>]     :<C-u>call <SID>languageclient_definition()<CR>
  endfunction
  Gautocmdft go,goomd,rust call s:nvim_lsp_setup()
else
  Gautocmdft go,gomod call s:languageclient_setup()
endif

"" auto format on save
" Gautocmd BufWritePre *.go call LanguageClient#textDocument_formatting_sync()

"" C CXX ObjC:
Gautocmdft c,cpp  nnoremap <silent><buffer><C-k>       :<C-u>call <SID>open_online_cfamily_doc()<CR>
if dein#tap('vim-clang-format')
  Gautocmdft c,cpp,objc,objcpp,proto nmap     <buffer><Leader>x        <Plug>(operator-clang-format)
  Gautocmdft c,cpp,objc,objcpp,proto nmap     <buffer><Leader>C        :<C-u>ClangFormatAutoToggle<CR>
  Gautocmdft c,cpp,objc,objcpp,proto nnoremap <buffer><LocalLeader>f   :<C-u>ClangFormat<CR>
endif

"" Protobuf:
" Gautocmdft proto nmap <silent><LocalLeader>f  :<C-u>call PrototoolFormat()<CR>

"" Yaml:

"" Markdown:
Gautocmdft markdown nmap <silent><LocalLeader>f  :<C-u>call markdownfmt#Format()<CR>

"" Vim:
" http://ku.ido.nu/post/90355094974/how-to-grep-a-word-under-the-cursor-on-vim
Gautocmdft vim nnoremap <silent><buffer>K      :<C-u>Help<Space><C-r><C-w><CR>
" Gautocmdft vim nnoremap <silent><buffer><C-]>  :<C-u>tag <c-r>=expand("<cword>")<CR><CR>zz

"" Ouickfix:
Gautocmdft qf  nnoremap <buffer><CR>      <CR>

"" Help:
Gautocmdft help nnoremap <silent><buffer><C-n> :<C-u>cnext<CR>
Gautocmdft help nnoremap <silent><buffer><C-p> :<C-u>cprevious<CR>

" -------------------------------------------------------------------------------------------------
" Insert: (i)

" <C-c> doesn't trigger the InsertLeave autocmd
inoremap <C-c> <ESC>

" Move cursor to first or end of line
inoremap <silent><C-a>  <C-o><S-i>
inoremap <silent><C-e>  <C-o><S-a>

" Put +register word
inoremap <silent><C-p>  <C-r>*
inoremap <silent><C-j>  <C-r>*

" Language:

"" Go Yaml Json:
Gautocmdft c,go,yaml,json inoremap <buffer> "    '
Gautocmdft c,go,yaml,json inoremap <buffer> '    "

"" Swift:
Gautocmdft swift imap <buffer><C-k>  <Plug>(autocomplete_swift_jump_to_placeholder)

" Plugins:
"" Deoplete:
inoremap <silent><expr><CR>     pumvisible() ? deoplete#close_popup() : "\<CR>"
inoremap <silent><expr><BS>     pumvisible() ? deoplete#close_popup()."\<C-h>" : "\<C-h>"
inoremap <silent><expr><C-h>    pumvisible() ? deoplete#close_popup()."\<C-h>" : "\<C-h>"
inoremap <silent><expr><Up>     pumvisible() ? "\<C-p>"  : "\<Up>"
inoremap <silent><expr><Down>   pumvisible() ? "\<C-n>"  : "\<Down>"
inoremap <silent><expr><C-z>    pumvisible() ? "\<C-z>" : deoplete#mappings#undo_completion()
"" Neosnippet:
imap     <silent><expr><C-k>    neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-k>"

" -------------------------------------------------------------------------------------------------
" Visual Select: (v)

" Do not add register to current cursor word
vnoremap c       "_c
vnoremap x       "_x
vnoremap P       "_dP
vnoremap p       "_dp
vnoremap @       ^
vnoremap ^       @
" sort by ignorecase alphabetically.
vnoremap <silent>gs :<C-u>'<,'>sort i<CR>
vnoremap v       <End>h
" Move to start of line
vnoremap V ^
" Jump to match pair brackets
vnoremap <S-Tab> %

vmap <silent>gx              <Plug>(openbrowser-smart-search)
nmap <silent>gc              <Plug>(caw:hatpos:toggle)
vmap <silent>gc              <Plug>(caw:hatpos:toggle)
vmap <silent><LocalLeader>t  :<C-u>Trans<CR>
vmap <silent>ga              <Plug>(LiveEasyAlign)


" Language:

"" Protobuf:
Gautocmdft proto vnoremap <buffer><Leader>cf  :<C-u>ClangFormat<CR>

"" C CXX ObjC:
Gautocmdft c,cpp,objc,objcpp,proto vnoremap <buffer><Leader>cf  :<C-u>ClangFormat<CR>

" -------------------------------------------------------------------------------------------------
" Visual: (x)
xmap  <LocalLeader>        <Plug>(operator-replace)

xnoremap <silent><C-t>     :<C-u>Trans<CR>

" Language:

" -------------------------------------------------------------------------------------------------
" Select: (s)

" neosnippet
smap     <silent><expr><C-k> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-k>"

" Language:

"" Go Yaml Json:
Gautocmdft go,yaml,json xnoremap <buffer> "    '
Gautocmdft go,yaml,json xnoremap <buffer> '    "

" -------------------------------------------------------------------------------------------------
" Command Line: (c)

" Move beginning of the command line
" http://superuser.com/a/988874/483994
cnoremap <C-a>          <Home>
cnoremap <C-d>          <Del>
cnoremap <C-k>          <C-\>e(strpart(getcmdline(), 0, getcmdpos()-1))<CR>
cnoremap <expr><Up>     pumvisible() ? "\<C-p>"  : "\<Up>"
cnoremap <expr><Down>   pumvisible() ? "\<C-n>"  : "\<Down>"

" -------------------------------------------------------------------------------------------------
" Terminal: (t)

" Emacs like mapping
tnoremap <silent>qq                <C-\><C-n>
tnoremap <silent><buffer><expr>jj  <SID>find_proc_in_tree(b:terminal_job_pid, 'nvim', 0) ? '<ESC>' : '<C-\><C-N>'
tnoremap <buffer><S-Left>          <C-[>b
tnoremap <buffer><C-Left>          <C-[>b
tnoremap <buffer><S-Right>         <C-[>f
tnoremap <buffer><C-Right>         <C-[>f
tnoremap <nowait><buffer><BS>      <BS>

" -------------------------------------------------------------------------------------------------

" filetype plugin indent on  " enable loading the plugin file and indent file for specific file types. Note that `filetype on` is same meaning, DONT USE?
" if has('vim_starting') && !exists('g:syntax_on') || g:syntax_on == 0
" if !exists('g:syntax_on')
"   syntax enable  " `on` is slow, `default` is doesn't enable syntax
" endif
colorscheme hybrid
syntax   sync fromstart
syntax   sync minlines=100000


" Global:
highlight! NonText                     gui=NONE      guifg=NONE     guibg=NONE     guisp=fg_indexed,bg_indexed
highlight! TermCursor                  gui=NONE      guifg=#222223  guibg=#ffffff  guisp=fg_indexed,bg_indexed
highlight! TermCursorNC                gui=reverse   guifg=#222222  guibg=#ffffff  guisp=fg_indexed,bg_indexed

" FileType:
"" Go:
" #cc6666
highlight! goStdlibErr                 gui=bold      guifg=#ff005f  guibg=NONE     guisp=fg_indexed,bg_indexed
highlight! goString                    gui=NONE      guifg=#92999f  guibg=NONE     guisp=fg_indexed,bg_indexed
" highlight! goComment                   gui=italic    guifg=#838c93  guibg=NONE     guisp=fg_indexed,bg_indexed
highlight! goPackageComment            gui=italic    guifg=#838c93  guibg=NONE     guisp=fg_indexed,bg_indexed
highlight! goField                     gui=bold      guifg=#a1cbc5  guibg=NONE     guisp=fg_indexed,bg_indexed
highlight! link                        goBuiltins                   Keyword
" highlight! goFunction                gui=bold      guifg=#ffcb6b  guibg=NONE     guisp=fg_indexed,bg_indexed
highlight! link                        goStdlib                     Statement
highlight! link                        goStdlibReturn               PreProc
highlight! link                        goImportedPkg                Statement
highlight! link                        goFormatSpecifier            PreProc
" highlight! goExtraType               gui=bold      guifg=#f0c674  guibg=NONE     guisp=fg_indexed,bg_indexed
" highlight! link                        goTypeName                       goExtraType
" highlight! link                        goReceiverType                   goExtraType

"" Python:
highlight! pythonSpaceError            gui=None      guifg=#787f86  guibg=#787f86  guisp=fg_indexed,bg_indexed
highlight! link                        pythonDelimiter              Special
highlight! link                        pythonNone                   pythonFunction
highlight! link                        pythonSelf                   pythonOperator

function! s:semshi_highlight()
  highlight semshiLocal           gui=None       guifg=#ff875f     guisp=fg_indexed,bg_indexed
  highlight semshiGlobal          gui=None       guifg=#ffaf00     guisp=fg_indexed,bg_indexed
  " highlight semshiImported        gui=bold       guifg=#ffaf00     guisp=fg_indexed,bg_indexed
  highlight semshiImported        gui=bold       guifg=#81a2be     guisp=fg_indexed,bg_indexed
  highlight semshiParameter       gui=None       guifg=#5fafff     guisp=fg_indexed,bg_indexed
  highlight semshiParameterUnused gui=underline  guifg=#87d7ff     guisp=fg_indexed,bg_indexed
  highlight semshiFree            gui=None       guifg=#ffafd7     guisp=fg_indexed,bg_indexed
  highlight semshiBuiltin         gui=None       guifg=#ff5fff     guisp=fg_indexed,bg_indexed
  " highlight semshiBuiltin         gui=bold       guifg=#b294bb     guisp=fg_indexed,bg_indexed
  highlight semshiAttribute       gui=None       guifg=#00ffaf     guisp=fg_indexed,bg_indexed
  highlight semshiSelf            gui=None       guifg=#b2b2b2     guisp=fg_indexed,bg_indexed
  highlight semshiUnresolved      gui=underline  guifg=#ffff00     guisp=fg_indexed,bg_indexed
  " highlight semshiSelected        gui=None       guifg=#ffffff  guibg=#d7005f     guisp=fg_indexed,bg_indexed
  highlight semshiSelected        gui=underline,italic guifg=#add6ff  guibg=#222223     guisp=fg_indexed,bg_indexed
  highlight semshiErrorSign       gui=None       guifg=#ffffff  guibg=#d70000     guisp=fg_indexed,bg_indexed
  highlight semshiErrorChar       gui=None       guifg=#ffffff  guibg=#d70000     guisp=fg_indexed,bg_indexed
  sign define semshiError text=E> texthl=semshiErrorSign
endfunction
Gautocmdft python call s:semshi_highlight()

" CPP:
highlight! doxygenBrief                gui=NONE      guifg=#81a2be  guibg=NONE     guisp=fg_indexed,bg_indexed
highlight! doxygenSpecialMultilineDesc gui=NONE      guifg=#81a2be  guibg=NONE     guisp=fg_indexed,bg_indexed
highlight! doxygenSpecialOnelineDesc   gui=NONE      guifg=#81a2be  guibg=NONE     guisp=fg_indexed,bg_indexed

"" Vim:
Gautocmdft qf hi Search                gui=NONE      guifg=NONE     guibg=#373b41  guisp=fg_indexed,bg_indexed

"" Plugin:

""" Denite:
" guibg=#343941
highlight! DeniteMatchedChar           gui=NONE      guifg=#85678f                 guisp=fg_indexed,bg_indexed
highlight! DeniteMatchedRange          gui=NONE      guifg=#f0c674                 guisp=fg_indexed,bg_indexed
highlight! DenitePreviewLine           gui=NONE      guifg=#85678f                 guisp=fg_indexed,bg_indexed
highlight! DeniteUnderlined            gui=NONE      guifg=#85678f                 guisp=fg_indexed,bg_indexed

"" ParenMatch:
highlight! ParenMatch                  gui=underline guifg=NONE     guibg=#343941  guisp=fg_indexed,bg_indexed

"" VimIlluminate:
highlight! illuminatedWord             gui=underline                               guisp=fg_indexed,bg_indexed
