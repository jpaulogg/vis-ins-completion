-- insert completion: keyword, dictionary, line and character

local plugin = 'plugins/ins-completion/'

local d = require(plugin..'complete-dict')
local K = require(plugin..'complete-keyword')
-- dictfiles =  { 
-- 	path = '~/.local/share/dict/',
-- 	text = '/usr/share/words',
-- }

table.insert(K.completeopts.default, long_words)
K.completeopts.text = {
-- apenas o primeiro comando lê a entrada padrão (no caso, o conteúdo do arquivo)
	"tr -s '[:blank:][:punct:]' '\n'",
	"cat " .. dictfiles.path .. "text",
}
K.completeopts.bash = {
	"wl.sh -W",
	"dmenu_path",
	"cat " .. dictfiles.path .. "bash",
}

local L = require(plugin..'complete-line')
-- L.vis_menu_lines = 4 -- default

local C = require(plugin..'complete-char')
