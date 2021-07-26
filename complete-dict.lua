-- completes words in dictionary file defined by syntax.

dictfiles =  { 
	dirname = '~/.local/share/dict/',
--	text = '/usr/share/words',
}

vis:map(vis.modes.INSERT, "<C-x><C-k>", function()
	local win = vis.win
	local file = win.file

	local pos = win.selection.pos
	if not pos then return end
	local range = file:text_object_word(pos > 0 and pos-1 or pos);
	if not range then return end
	if range.finish > pos then range.finish = pos end
	if range.start == range.finish then return end
	local prefix = file:content(range)
	if not prefix then return end

	local syntax = win.syntax or 'bash' -- useful in the command prompt
	local dict = dictfiles[syntax] or dictfiles["dirname"] .. syntax
	local cmd = string.format([[grep '^%s' %s | vis-menu -p 'dictionary:' | tr -d '\n']],
		prefix, dict)
	local status, out, err = vis:pipe(file, { start = 0, finish = 0 }, cmd)
	if status ~= 0 or not out then
		if err then vis:info(err) end
		return
	end
	if vis.mode == vis.modes.INSERT then
		vis:insert(out:gsub('^' .. prefix, ''))
	elseif vis.mode == vis.modes.REPLACE then
		vis:replace(out:gsub('^' .. prefix, ''))
	end
end, "Complete word in dictionary file")
