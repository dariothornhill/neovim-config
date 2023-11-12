local colorscheme = "nightfly"

local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status then
	vim.notify("color scheme " .. colorscheme .. " not found")
	return
end
