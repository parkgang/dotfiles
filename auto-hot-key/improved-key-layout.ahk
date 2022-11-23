;
;
; CapsLock을 이용하여 손쉽게 키보드 레이아웃 개선하기

; 기본 CapsLock기능을 꺼둠
SetCapsLockState, AlwaysOff

; CapsLock + t 키로 기본 CapsLock를 키고 끔 
Capslock & t::Capslock

; CapsLock 키를 누르고 있을 경우
#If GetKeyState("Capslock","P")

; 방향키 맵핑
h::Left
j::Down
k::Up
l::Right

; 이동 커맨드 맵핑
a::Home
s::PgDn
d::PgUp
f::End

; 삭제 커맨트 맵핑
x::Del
+x::BackSpace ; shift + x

#If

;
;
; [Ctrl+Space로 한/영 전환](https://kwonkyo.tistory.com/406)
^Space::
  send, {vk15sc138}
return