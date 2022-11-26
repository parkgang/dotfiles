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
