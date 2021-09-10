-- Line completion for vis editor
local M = { VIS_MENU_LINES = 4, }

vis:map(vis.modes.INSERT, "<C-x><C-l>", function()
	local win = vis.win
	local file = win.file
	local sel = win.selection
	local lnum = sel.line
	local pos = sel.pos
	local line = file.lines[lnum]
	local prefix = line:sub(1, pos):gsub("^%s+", "")
	local cmd = string.format([[sed 's/^\s\+//' | vis-complete -l %d '%s']],
		M.VIS_MENU_LINES,
		prefix:gsub("'", "'\''"))
	local status, out, err = vis:pipe(file, {start = 0, finish = file.size}, cmd)
	if status ~= 0 or not out then
		if err then vis:info(err) end
		return
	end
	vis:insert(out)
end, "Complete line in current file")

return M
