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



-- 
-- 
-- 키보드 입력 시 특정 프로그램 호출 하도록
hs.hotkey.bind({"option"}, "1", function()
  hs.application.launchOrFocus("Google Chrome")
end)
hs.hotkey.bind({"option"}, "2", function()
  hs.application.launchOrFocus("Visual Studio Code")
end)
hs.hotkey.bind({"option"}, "3", function()
  hs.application.launchOrFocus("iTerm")
end)
hs.hotkey.bind({"option"}, "4", function()
  hs.application.launchOrFocus("Notion")
end)
hs.hotkey.bind({"option"}, "5", function()
  hs.application.launchOrFocus("TextEdit")
end)



--
--
-- 윈도우 힌트
-- 힌트 키를 왼손으로만 입력할 수 있도록 힌트에 표시되는 키 리스트 변경
hs.hints.hintChars = {'1', '2', '3', '4', 'Q', 'W', 'E', 'R'}
hs.hotkey.bind({'shift'}, 'F1', hs.hints.windowHints)
