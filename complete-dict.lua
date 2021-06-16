-- completa palavras em dicionários definidos por syntax.
-- completes words in dictionary file defined by syntax.

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
	local syntax = win.syntax or 'bash'  -- dicionário padrão (útil na linha de comando)
	if not syntax or not prefix then return end
	local dictionary = "~/.config/vis/dict/"..syntax
	local cmd = string.format("vis-complete '%s' < %s", prefix, dictionary)
	local menu = io.popen(cmd)
	local out = menu:read("*all")
	local sucess, status = menu:close()
	vis:redraw()
	if out and sucess then
		if vis.mode == vis.modes.INSERT then
			vis:insert(out)
		elseif vis.mode == vis.modes.REPLACE then
			vis:replace(out)
		end
	elseif status ~= 0 then
		vis:info(out)
	end
end, "Complete word in dictionary file - vis/dict/{syntax}")
