local InitGlobalsOrigin = InitGlobals
function InitGlobals()

InitGlobalsOrigin()
-- Bundled by luabundle {"version":"1.6.0"}
local __bundle_require, __bundle_loaded, __bundle_register, __bundle_modules = (function(superRequire)
	local loadingPlaceholder = {[{}] = true}

	local register
	local modules = {}

	local require
	local loaded = {}

	register = function(name, body)
		if not modules[name] then
			modules[name] = body
		end
	end

	require = function(name)
		local loadedModule = loaded[name]

		if loadedModule then
			if loadedModule == loadingPlaceholder then
				return nil
			end
		else
			if not modules[name] then
				if not superRequire then
					local identifier = type(name) == 'string' and '\"' .. name .. '\"' or tostring(name)
					error('Tried to require ' .. identifier .. ', but no such module has been registered')
				else
					return superRequire(name)
				end
			end

			loaded[name] = loadingPlaceholder
			loadedModule = modules[name](require, loaded, register, modules)
			loaded[name] = loadedModule
		end

		return loadedModule
	end

	return require, loaded, register, modules
end)(require)
__bundle_register("__root", function(require, _LOADED, __bundle_register, __bundle_modules)
local a = require("lua/a")
end)
__bundle_register("lua/a", function(require, _LOADED, __bundle_register, __bundle_modules)
local b = require("lua/b")
print(b)

local a = { 'a', 1, 2, 3, 4, 5 }
return a



end)
__bundle_register("lua/b", function(require, _LOADED, __bundle_register, __bundle_modules)
local b = { 'a', 1, 2, 3, 4 }

return b
end)
return __bundle_require("__root")

end