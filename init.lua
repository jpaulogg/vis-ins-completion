-- insert completion: keyword, dictionary, line and character

local plugin = 'plugins/ins-completion/'

local D = require(plugin..'complete-dict')
local K = require(plugin..'complete-keyword')
local L = require(plugin..'complete-line')
local C = require(plugin..'complete-char')

-- DICTFILES =  { 
-- 	dirname = '~/.local/share/dict/',
-- 	text = '/usr/share/words',
-- }

-- L.vis_menu_lines = 4 -- default

K.completeopts.default.w =  "wl.sh -W"
K.completeopts.bash = {
	string.format("cat - $HISTFILE '%s' | wl.sh -W",
		DICTFILES.dirname .. "bash"),
	"dmenu_path",
}
K.completeopts.text = {
	"tr -s '[:blank:][:punct:]' '\n'",
	"cat " .. DICTFILES.dirname .. "text",
}


