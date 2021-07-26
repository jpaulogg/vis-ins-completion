-- insert completion plugins: keyword, dictionary, line and character

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

-- K.completeopts.default.w = "tr -cs '[:alnum:]_.:-' '\n'"  -- WORDS instead of words
-- K.completeopts.bash = {
	-- "tr -cs '[:alnum:]_' '\n'",  -- only one command will read file content
	-- "dmenu_path",                -- dmenu_path script ships with dmenu(1)
-- }

