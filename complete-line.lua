-- Line completion for vis editor
local M = { VIS_MENU_LINES = 4, }

vis:map(vis.modes.INSERT, "<C-x><C-l>", function()
	local win = vis.win
	local file = win.file
	local sel = win.selection
	local lnum = sel.line
	local col = sel.col
	local line = file.lines[lnum]
	local prefix = line:sub(1, col-1):gsub("^%s+", "")
	local cmd = string.format([[sed 's/^\s\+//; /^$/d' | grep -F "%s" | vis-menu -i -b -l %d]],
		prefix:gsub('[$\\"]', "\\%0"),
		M.VIS_MENU_LINES)
	local status, out, err = vis:pipe(file, {start = 0, finish = file.size}, cmd)
	if status ~= 0 or not out then
		if err then vis:info(err) end
		return
	end
	local out = out:gsub("\n", "")
	vis:insert(out:sub(#prefix + 1))
end, "Complete line in current file")

return M
