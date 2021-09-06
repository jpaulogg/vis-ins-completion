-- insert completion plugins: keyword, dictionary, line and character

local plugin = 'plugins/ins-completion/'

local d = require(plugin..'complete-dict')
local k = require(plugin..'complete-keyword')
local l = require(plugin..'complete-line')
local c = require(plugin..'complete-char')

-- dictfiles =  { 
-- 	dirname = '$HOME/.local/share/dict/',
-- 	text = '/usr/share/words',
-- }

-- L.VIS_MENU_LINES = 4 -- default

-- K.completeopts.default.w = "tr -cs '[:alnum:]_.:-' '\n'"  -- WORDS instead of words
-- K.completeopts.bash = {
	-- "tr -cs '[:alnum:]_' '\n'",  -- only one command will read file content
	-- "dmenu_path",                -- dmenu_path script ships with dmenu(1)
-- }
