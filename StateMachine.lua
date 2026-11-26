StateMachine = Class{}

function StateMachine:init(states)
	self.empty = {
		render = function() end,
		update = function() end,
		processAI = function() end,
		enter = function() end,
		exit = function() end
	}
	self.states = states or {} -- [name] -> [function that returns states]
	self.current = self.empty
end

function StateMachine:change(state, enterParams)
    if type(state) == 'string' then
        assert(self.states[state])
        state = self.states[state]()
    end
    self.current:exit()
    self.current = state
    self.current:enter(enterParams)
end

function StateMachine:update(dt)
	self.current:update(dt)
end

function StateMachine:render()
	self.current:render()
end

--[[
	Used for states that can be controlled by the AI to influence update logic.
]]
function StateMachine:processAI(params, dt)
	self.current:processAI(params, dt)
end
