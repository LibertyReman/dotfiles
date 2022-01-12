
-- ------------------------------------------------------------------------------
local simpleCmd = false
local map = hs.keycodes.map
local function eikanaEvent(event)
    local c = event:getKeyCode()
    local f = event:getFlags()
    if event:getType() == hs.eventtap.event.types.keyDown then
        if f['cmd'] then
            simpleCmd = true
            -- hs.alert.show('test')
        end
    elseif event:getType() == hs.eventtap.event.types.flagsChanged then
        if not f['cmd'] then  -- key down, don't work rightcmd
            if simpleCmd == false then
                if c == map['rightcmd'] then -- rightcmd type
                    if 'Hiragana' == hs.keycodes.currentMethod() then
                        hs.keycodes.setMethod('Romaji')
                    else
                        hs.keycodes.setMethod('Hiragana')
                    end
                end
            end
            simpleCmd = false
        end -- key up
        -- hs.alert.show('test')
    end
end

eikana = hs.eventtap.new({hs.eventtap.event.types.keyDown, hs.eventtap.event.types.flagsChanged}, eikanaEvent)
eikana:start()

-- ------------------------------------------------------------------------------
local function keyCode(key, modifiers)
    modifiers = modifiers or {}
    return function()
        hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
        hs.timer.usleep(1000)
        hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
    end
end

local function remapKey(modifiers, key, keyCode)
    hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
end

remapKey({'cmd'}, 'h', keyCode('left'))
remapKey({'cmd'}, 'j', keyCode('down'))
remapKey({'cmd'}, 'k', keyCode('up'))
remapKey({'cmd'}, 'l', keyCode('right'))

remapKey({'cmd', 'shift'}, 'h', keyCode('left', {'shift'}))
remapKey({'cmd', 'shift'}, 'j', keyCode('down', {'shift'}))
remapKey({'cmd', 'shift'}, 'k', keyCode('up', {'shift'}))
remapKey({'cmd', 'shift'}, 'l', keyCode('right', {'shift'}))



