--[[
    PauseState for cool pauses
]]

PauseState = Class{__includes = BaseState}

function PauseState:init()
    -- nothing
end

function PauseState:update(dt)
    -- nothing
end

function PauseState:render()
    love.graphics.printf('PAUSE', 0, 100, VIRTUAL_WIDTH, 'center')
end