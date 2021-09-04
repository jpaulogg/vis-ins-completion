-- insert completion plugins: keyword, dictionary, line and character

local plugin = "plugins/ins-completion/"

local d = require(plugin.."complete-dict")
local k = require(plugin.."complete-keyword")
local l = require(plugin.."complete-line")
local c = require(plugin.."complete-char")

-- dictfiles =  { 
-- 	dirname = '~/.local/share/dict/',
-- 	text = '/usr/share/words',
-- }

-- l.VIS_MENU_LINES = 4 -- default

-- usar PALVRAS(longas) ao invés de palavras(curtas)
k.completeopts.default.w = [[tr -s "[:blank:]([{,;='\"" "\n"]]

k.completeopts.bash = {
	[[tr -s "[:blank:]([{,;='\"" "\n"]],
	"cat ~/.local/share/dict/bash",
	"dmenu_path",
}
