-- insert completion: keyword, dictionary, line and character

local plugin = 'plugins/ins-completion/'

local d = require(plugin..'complete-dict')
local K = require(plugin..'complete-keyword')
-- dictfiles =  { 
-- 	path = '~/.local/share/dict/',
-- 	text = '/usr/share/words',
-- }

local long_words = "wordlist -W"
table.insert(K.completeopts.default, long_words)
K.completeopts.text = {
	long_words,
	"tr -s '[:blank:][:punct:]' '\n'",
	"cat " .. dictfiles.path .. "text", -- can't precede any command that uses stdin
}
K.completeopts.bash = {
	long_words,
	"tr -cs '[:alnum:]_' '\n'",
	"dmenu_path",
	"cat " .. dictfiles.path .. "bash",
}

local L = require(plugin..'complete-line')
-- L.vis_menu_lines = 4 -- default

local C = require(plugin..'complete-char')
