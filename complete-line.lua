-- Line completion for vis editor
local M = { vis_menu_lines = 4 }

vis:map(vis.modes.INSERT, "<C-x><C-l>", function()
	local win = vis.win
	local file = win.file
	local sel = win.selection
	local lnum = sel.line
	local cnum = sel.col
	local line = file.lines[lnum]
	local prefix = line:sub(1, cnum - 1):gsub("^%s+", "")
	local cmd = string.format([[sed 's/^\s\+//' | vis-complete -l %d '%s']],
		M.vis_menu_lines,
		prefix:gsub("'", "'\\''"))
	local status, out, err = vis:pipe(file, {start = 0, finish = file.size}, cmd)
	if status ~= 0 or not out then
		if err then vis:info(err) end
		return
	end
	vis:insert(out)
end, "Complete line in current file")

return M
