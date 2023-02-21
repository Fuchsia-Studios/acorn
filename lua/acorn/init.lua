local lush = require('lush')
local theme = require('acorn.theme')

local function setup(user_config)
	if user_config then
		-- TODO
	end

	return theme
end

return {setup = setup}
