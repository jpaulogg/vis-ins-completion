-- completa palavras de diferentes fontes (arquivo atual e
-- arquivo-dicionário definido por syntax)

-- complete words from differentes sources (current file and
-- dictionary file defined by syntax)

vis:map(vis.modes.INSERT, "<C-n>", function()
	local win = vis.win
	local file = win.file
	local pos = win.selection.pos
	if not pos then return end
	local range = file:text_object_word(pos > 0 and pos-1 or pos);
	if not range then return end
	if range.finish > pos then range.finish = pos end
	if range.start == range.finish then return end
	local prefix = file:content(range)
	local syntax = win.syntax or 'text'  -- 'text' como dicionário padrão
	if not syntax or not prefix then return end
	-- combinar as diferentes fontes aqui:
	local cmd = string.format("{ %s; %s; } | sort -u | vis-complete '%s'",
		"tr -cs '[:alnum:]_' '\n'",          -- arquivo atual
		"cat ~/.config/vis/dict/"..syntax,   -- arquivo-dicionário
		prefix)
	local status, out, err = vis:pipe(file, { start = 0, finish = file.size }, cmd)
	if status ~= 0 or not out then
		if err then vis:info(err) end
		return
	end
	if vis.mode == vis.modes.INSERT then
		vis:insert(out)
	elseif vis.mode == vis.modes.REPLACE then
		vis:replace(out)
	end
end, "Complete keyword in current file or external dictionary - ~/.config/vis/dict/{syntax}")
