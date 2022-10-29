"
"
" Plugins
call plug#begin()

" 손쉽게 괄호를 지정할 수 있도록
Plug 'tpope/vim-surround'
" 숫자 이외 <C-a> , <C-x> 시 반대 요소로 변경할 수 있도록
Plug 'tenfyzhong/axring.vim'

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



"
"
" 기본적인 설정

" 라인 줄번호 보이도록
set number

" 타이틀바에 현재 편집 중인 파일을 표시: Terminal 환경에서 Tab만으로 어떤 파일을 수정하는지 알게 하기 위함
set title

" tab 간격 조절
set tabstop=2

" `>>` 와 같은 작업 시 4칸 띄우도록
set shiftwidth=2

" [<C-r>으로 클립보드를 붙어넣더라도 자동으로 개행되지 않도록](https://www.lesstif.com/system-admin/vim-code-paste-auto-indent-6979764.html)
set paste

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



"
"
" iabbr
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
" VSCode
if exists('g:vscode')
    echo "Neovim이 VSCode에서 실행 중 입니다 ✨"

    " [폴더 접기 명령 수행시 VSCode 단축키 호출](https://github.com/vscode-neovim/vscode-neovim/issues/58#issuecomment-989481648)
    nnoremap zM :call VSCodeNotify('editor.foldAll')<CR>
    nnoremap zR :call VSCodeNotify('editor.unfoldAll')<CR>
    nnoremap zc :call VSCodeNotify('editor.fold')<CR>
    nnoremap zC :call VSCodeNotify('editor.foldRecursively')<CR>
    nnoremap zo :call VSCodeNotify('editor.unfold')<CR>
    nnoremap zO :call VSCodeNotify('editor.unfoldRecursively')<CR>
    nnoremap za :call VSCodeNotify('editor.toggleFold')<CR>
endif
