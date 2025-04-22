-- lua/lang_switcher.lua
local current_lang = nil

local available_langs = {
	"go",
	"rust",
	-- Add more as you create them
}

local M = {}

function M.list()
	return available_langs
end

function M.switch(lang)
	if current_lang and current_lang ~= lang then
		local ok, prev = pcall(require, "langs." .. current_lang)
		if ok and prev.disable then
			prev.disable()
		end
	end

	local ok, new = pcall(require, "langs." .. lang)
	if ok and new.enable then
		new.enable()
		current_lang = lang
		print("🔄 Switched to language preset: " .. lang)
	else
		print("⚠️ Preset not found: " .. lang)
	end
end

return M
