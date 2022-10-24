"
" 2022-10-23자로 NeoVim으로 전환하여 해당 설정은 fresh하지 않습니다. NeoVim 설정을 참고해주세요.
"

" Common -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="

" 디폴트로 라인 번호 표기
set number
" surround 플러그인도 활성화해야 하는데 설치해야 할 수 있음
" set surround

" Windows with WSL -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="

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