-- complete words from differentes sources (current file and dictionary)

local M = {}
M.completeopts = {
	default = {
		d = function(syntax)
			local dict = dictfiles[syntax] or (dictfiles["dirname"] and (dictfiles["dirname"] .. syntax)) or "/dev/null"
			local cmd = "cat " ..  dict
			return cmd
		end,
		w = "tr -cs '[:alnum:]_' '\n'",
	},
--	text = { list of commands },
}

local function group_cmds(tbl, syn)
	local cmds = {}
	local tbl_key = tbl[syn] or tbl['default']
	for k,v in pairs(tbl_key) do
		if k == 'd' then
			table.insert(cmds, v(syn))
		else
			table.insert(cmds, v)
		end
	end
	return table.concat(cmds, ';')
end

vis:map(vis.modes.INSERT, "<C-n>", function()
	local win = vis.win
	local file = win.file
	local pos = win.selection.pos
	if not pos then return end
	local range = file:text_object_longword(pos > 0 and pos-1 or pos);
	if not range then return end
	if range.finish > pos then range.finish = pos end
	if range.start == range.finish then return end
	local prefix = file:content(range)
	if not prefix then return end
	local _, j = string.find(prefix, "[([{'\",;=]+")
	if j then prefix = prefix:sub(j + 1) end
	local syntax = win.syntax or 'text'
	local cmd = string.format(
		"{ %s; } | grep '^%s.' | sort -u | vis-menu -i -b -p 'keyword:'",
		group_cmds(M.completeopts, syntax),
		prefix
	)
	local status, out, err = vis:pipe(file, { start = 0, finish = file.size }, cmd)
	if status ~= 0 or not out then
		if err then vis:info(err) end
		return
	end
	local out = out:gsub("\n$", ""):gsub("^"..prefix, "")
	if vis.mode == vis.modes.INSERT then
		vis:insert(out)
	elseif vis.mode == vis.modes.REPLACE then
		vis:replace(out)
	end
end, "Complete keyword in current file or in an external dictionary")

return M
