-- 
-- 
-- <C-[>  조합키를 눌렀을 때 한영전환을 하고 Normal Mode 로 복귀하기
local inputEnglish = "com.apple.keylayout.ABC"

-- 현재의 입력소스가 한글이라면 영어입력소스와 같지 않기 때문에 현재의 입력소스를 영어로 전환하는 로직이 수행 
function switchEnglish()
	local inputSource = hs.keycodes.currentSourceID()
	if not (inputSource == inputEnglish) then
		hs.keycodes.currentSourceID(inputEnglish)
	end
	hs.eventtap.keyStroke({}, 'escape')
end

-- 컨트롤 키와 33번에 해당하는 키 '[' 를 함께 눌렀을 때 함수를 호출
hs.hotkey.bind({'control'}, 33, switchEnglish)
