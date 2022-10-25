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
" [system 클립보드와 연동](https://www.reddit.com/r/neovim/comments/3fricd/comment/ctr8t3h/?utm_source=share&utm_medium=web2x&context=3)
set clipboard=unnamedplus
" >> 와 같은 작업시 4칸 띄우도록
set shiftwidth=4
" 타이틀바에 현재 편집 중인 파일을 표시: Terminal 환경에서 Tab만으로 어떤 파일을 수정하는지 알게 하기 위함
set title
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
" Windows with WSL
" 마운트 지점에 따라 이 경로를 변경하세요.
let s:clip = '/mnt/c/Windows/System32/clip.exe'
" /mnt/c/Windows/ 경로 관련 실행 파일이 있으면 WSL 환경이라고 가정할 수 있습니다.
if executable(s:clip)
    " WSL에서 yank한 것을 Ctrl + v에서도 사용할 수 있도록
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END

    " Ctrl + c 값을 WSL에서 사용하기 위한 맵핑 입니다.
    " PowerShell 관련 명령어로 Windows의 클립보드 값을 가져옵니다.
    " 이후 추가적으로 이동하는 명령이 있는데 이는 PowerShell에서 붙어넣기 후 커서의 위치가 이상한 곳으로 날라가서 이를 보정하기 위한 명령 입니다.
    " Ctrl + c 값을 WSL에서 "+p 으로 사용할 수 있도록
    nnoremap "+p :exe 'norm a'.system('/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command Get-Clipboard')<CR>kdd0i<BS><C-[>
    " Ctrl + c 값을 WSL에서 <C-r>+ 으로 사용할 수 있도록
    inoremap <C-r>+ <C-[>:exe 'norm a'.system('/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command Get-Clipboard')<CR>kdd0i<BS>
endif
