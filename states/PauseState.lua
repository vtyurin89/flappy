--[[
    PauseState for cool pauses
]]

PauseState = Class{__includes = BaseState}

function PauseState:init(params)
    -- nothing
end

function PauseState:enter(params)
    self.prev = params.prev
end

function PauseState:update(dt)
    if love.keyboard.wasPressed('escape') then
        gStateMachine:change(self.prev)
    end
end

function PauseState:render()
    self.prev:render()
    love.graphics.printf('PAUSE', 0, 100, VIRTUAL_WIDTH, 'center')
end