"
"
" Plugins
call plug#begin()

" 손쉽게 괄호를 지정할 수 있도록
Plug 'tpope/vim-surround'
" 숫자 이외 <C-a> , <C-x> 시 반대 요소로 변경할 수 있도록
Plug 'tenfyzhong/axring.vim'
" m mark 위치를 표시
Plug 'kshenoy/vim-signature'

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



"
"
" 단축키 맵핑
" 아래 개행이 불편해서 맵핑
nmap <C-j> o<ESC>
" 위로 개행이 불편해서 맵핑
nmap <C-k> O<ESC>



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
" WSL에서 yank한 것을 Ctrl + v에서도 사용할 수 있도록
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
" Ctrl + c를 WSL에서 "+p 으로 사용할 수 있도록
noremap "+p :exe 'norm a'.system('/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command Get-Clipboard')<CR>
