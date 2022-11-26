--
--
-- test
-- hs.alert.show('Hello, world!')
-- hs.eventtap.keyStroke({'cmd'}, 'c')
--[[
hs.hotkey.bind({"capslock"}, "h", function()
	hs.eventtap.keyStroke({}, 'left', 1)
end, nil, function()
	hs.eventtap.keyStroke({}, 'left', 1)
end)
--]]
