-- insert completion: keyword, dictionary, line and character

local plugin = 'plugins/ins-completion/'

local D = require(plugin..'complete-dict')
local K = require(plugin..'complete-keyword')
local L = require(plugin..'complete-line')
local C = require(plugin..'complete-char')

-- dictfiles =  { 
-- 	dirname = '~/.local/share/dict/',
-- 	text = '/usr/share/words',
-- }

-- L.VIS_MENU_LINES = 4 -- default

K.completeopts.default.w = "wl.sh -W"
K.completeopts.bash = {
	"wl.sh -W",
	"dmenu_path",
}
K.completeopts.text = {
	"tr -s '[:blank:][:punct:]' '\n'",
	"cat " .. dictfiles.dirname .. "text",
}


