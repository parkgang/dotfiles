"
"
" Plugins
call plug#begin()

" 손쉽게 괄호를 지정할 수 있도록
Plug 'tpope/vim-surround'
" 숫자 이외 <C-a> , <C-x> 시 반대 요소로 변경할 수 있도록
Plug 'tenfyzhong/axring.vim'
" f 시리즈로 한글을 검색할 수 있도록
Plug 'johngrib/vim-f-hangul'

" VSCode에서 사용되지 않는 것들
if !exists('g:vscode')

	" 파일 탐색을 손쉽게 하기 위해서
	Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin' " nerdtree에 git 상태를 표시하기 위해서
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " 파일 아이콘 등 하이라이팅을 위해

	" 하단에 상태바 정보 보강
	Plug 'vim-airline/vim-airline'
	" airline 테마 지정
	Plug 'vim-airline/vim-airline-themes'

	" Git 변경사항 왼쪽에 +,- 같은 것 표시 (Airline에서 ?,?,? 와 같이 변경사항추적을 위하여 설치)
	Plug 'airblade/vim-gitgutter'

	" :Git 명령 수행 가능 (Airline에서 branch 표시하기 위하여 설치)
	Plug 'tpope/vim-fugitive'

	" 전체 검색을 위하서
	Plug 'ctrlpvim/ctrlp.vim'

	" 파일 아이콘, etc. 표시를 위해서(마지막에 로드되어야 함)
	Plug 'ryanoasis/vim-devicons'

endif

call plug#end()



"
"
" Plugins Setting
" axring
let axring_rings_common = [
    \ ['&&', '||'],
    \ ['&', '|', '^'],
    \ ['&=', '|=', '^='],
    \ ['>>', '<<'],
    \ ['>>=', '<<='],
    \ ['==', '!='],
    \ ['>', '<', '>=', '<='],
    \ ['++', '--'],
    \ ['true', 'false'],
    \ ['verbose', 'debug', 'info', 'warn', 'error', 'fatal'], 
\ ]
let axring_rings_js = [
    \ ['let', 'const'],
\ ]
let axring_rings_ts = [
    \ ['boolean', 'string', 'number'],
\ ]
let g:axring_rings = axring_rings_common 
    \ + axring_rings_js 
    \ + axring_rings_ts
" VSCode 이외에서 사용되는 Plugins Settings
if !exists('g:vscode')

	" NERDTree
	" [숨김 파일 기본적으로 보이도록](https://stackoverflow.com/a/5057406/14471375)
	let NERDTreeShowHidden=1
	" [트리에서 무시할 파일들](https://stackoverflow.com/a/53302030/14471375)
	let NERDTreeIgnore=['\.DS_Store$', '\.git$']
	" 손쉽게 접근할 수 있도록 단축키 확장
	nnoremap <leader>n :NERDTreeFocus<CR>
	nnoremap <leader>nt :NERDTreeToggle<CR>
	" NERDTree가 기본적으로 표시되고 파일이 지정되어 있으면 해당 창으로 커서 이동
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

	" airline
	" Powerline-font 활성화
	let g:airline_powerline_fonts=1 
	" Smarter tab line 활성화: 모든 파일 버퍼 출력
	let g:airline#extensions#tabline#enabled=1

	" airline theme
	let g:airline_theme='simple'

endif



"
"
" 기본적인 설정

" 라인 줄번호 보이도록
set number

" 타이틀바에 현재 편집 중인 파일을 표시: Terminal 환경에서 Tab만으로 어떤 파일을 수정하는지 알게 하기 위함
set title

" tab 간격 조절
set tabstop=2

" `>>` 와 같은 작업 시 띄울 값
set shiftwidth=2

" 편집기를 실행하자마자 폴딩되어있지 않도록
set nofoldenable
" 들여쓰기를 기준으로 폴딩을 수행합니다. 같은 들여쓰기 수준이면 같은 폴딩 레벨을 지닙니다.
set foldmethod=indent

" system 클립보드와 연동
" macOS: 설정 시 잘 동작함
" WSL: [해당 문서를 따라서 `win32yank.exe` 가 설치되어함](https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl)
set clipboard=unnamedplus

" [매크로 툴이 설치되지 않은 환경에서 fallback으로 사용될 한/영 전환문제 대응 설정](https://johngrib.github.io/blog/2017/05/04/input-source/#langmap%EC%9D%84-%EC%82%AC%EC%9A%A9%ED%95%98%EB%8A%94-%EB%B0%A9%EB%B2%95)
set langmap=ㅁa,ㅠb,ㅊc,ㅇd,ㄷe,ㄹf,ㅎg,ㅗh,ㅑi,ㅓj,ㅏk,ㅣl,ㅡm,ㅜn,ㅐo,ㅔp,ㅂq,ㄱr,ㄴs,ㅅt,ㅕu,ㅍv,ㅈw,ㅌx,ㅛy,ㅋz



"
"
" 단축키 맵핑
" 아래 개행이 불편해서 맵핑
nnoremap <C-j> o<ESC>
" 위로 개행이 불편해서 맵핑
nnoremap <C-k> O<ESC>
" 클립보드의 내용이 개행되지 않게 붙어넣을 수 있도록
inoremap <C-r> <C-r><C-o>
" 복사 레지스터 기능 보강
nnoremap Y y$
" 블랙홀 레지스터 쉽게 호출할 수 있도록 맵핑
nnoremap <Space>x "_x
vnoremap <Space>x "_x

nnoremap <Space>X "_X
vnoremap <Space>X "_X

nnoremap <Space>s "_s
vnoremap <Space>s "_s

nnoremap <Space>S "_S
vnoremap <Space>S "_S

nnoremap <Space>c "_c
vnoremap <Space>c "_c

nnoremap <Space>C "_C
vnoremap <Space>C "_C

nnoremap <Space>d "_d
vnoremap <Space>d "_d

nnoremap <Space>D "_D
vnoremap <Space>D "_D

nnoremap <Space>dd "_dd
vnoremap <Space>dd "_dd
" OS 클립보드 쉽게 호출할 수 있도록 맵핑
nnoremap <Space>p "+p
nnoremap <Space>P "+P
" [편집하는 파일 정보 클립보드로 복사](https://vim.fandom.com/wiki/Copy_filename_to_clipboard)
" 편집하는 파일명 클립보드로 복사
nnoremap ,cf :let @*=expand("%")<CR>
" 편집하는 파일 절대 경로 클립보드로 복사
nnoremap ,cp :let @*=expand("%:p")<CR>



"
"
" 레지스터
" <C-a> 단축키를 희생했음으로 편하게 전체 선택을 위한 메크로
let @a="ggVG"
" { 찾고 { 범위 반큼 비주얼로 확보
let @s="f{v%"



"
"
" 축약어(abbreviation)
" [Markdown 링크를 손쉽게 추가하기 위한 약어 이며 해당 링크의 컨셉을 참고함](https://stackoverflow.com/a/23428118/14471375)
iabbr __l []()<C-o>2<Left>
iabbr __name parkgang
iabbr __email ruddms936@naver.com
iabbr <expr> __time strftime("%Y-%m-%d %H:%M:%S")
iabbr <expr> __date strftime("%Y-%m-%d")
iabbr <expr> __file expand('%:p')
iabbr <expr> __name expand('%')
iabbr <expr> __pwd expand('%:p:h')
iabbr <expr> __branch system("git rev-parse --abbrev-ref HEAD")
iabbr <expr> __uuid system("uuidgen")



"
"
" VSCode 특별 설정
if exists('g:vscode')

    echo "Neovim이 VSCode에서 실행 중 입니다 ✨"

    "
    "
    " [폴더 접기 명령 수행시 VSCode 단축키 호출](https://github.com/vscode-neovim/vscode-neovim/issues/58#issuecomment-989481648)
    nnoremap zM :call VSCodeNotify('editor.foldAll')<CR>
    nnoremap zR :call VSCodeNotify('editor.unfoldAll')<CR>
    nnoremap zc :call VSCodeNotify('editor.fold')<CR>
    nnoremap zC :call VSCodeNotify('editor.foldRecursively')<CR>
    nnoremap zo :call VSCodeNotify('editor.unfold')<CR>
    nnoremap zO :call VSCodeNotify('editor.unfoldRecursively')<CR>
    nnoremap za :call VSCodeNotify('editor.toggleFold')<CR>
    " j, k 로 이동 시 접힌 부분이 펼쳐지지 않도록: 단, 매크로를 기록하는 동안 폴드 탐색이 중단됨
    function! MoveCursor(direction) abort
        if(reg_recording() == '' && reg_executing() == '')
            return 'g'.a:direction
        else
            return a:direction
        endif
    endfunction
    nmap <expr> j MoveCursor('j')
    nmap <expr> k MoveCursor('k')

endif
