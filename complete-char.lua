-- insert the character which is above/below the cursor

local function complete_char(direction)
	local file = vis.win.file
	local sel = vis.win.selection
	local lnum = sel.line + direction
	local cnum = sel.col
	local char = file.lines[lnum]:sub(cnum, cnum)
	if vis.mode == vis.modes.INSERT then
		vis:insert(char)
	elseif vis.mode == vis.modes.REPLACE then
		vis:replace(char)
	end
end

vis:map(vis.modes.INSERT, "<C-Up>", function()
	complete_char(-1)
end, "Insert the character which is above the cursor")

vis:map(vis.modes.INSERT, "<C-Down>", function()
	complete_char(1)
end, "Insert the character which is below the cursor")
