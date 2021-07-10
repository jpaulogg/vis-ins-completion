-- insert completion plugins: keyword, dictionary, line and character

local plugin = 'plugins/ins-completion/'

local d = require(plugin..'complete-dict')
local k = require(plugin..'complete-keyword')
-- dictfiles =  { 
-- 	path = '~/.local/share/dict/',
-- 	text = '/usr/share/words',
-- }

-- local long_words = "tr '[:alnum:]_.:-' '\n'"
-- table.insert(k.completeopts.default, long_words)
-- k.completeopts.bash = {
	-- "tr -cs '[:alnum:]_' '\n'",  -- uses file content, so it should be the first
	-- "dmenu_path",                -- dmenu_path script ships with dmenu(1)
-- }

local l = require(plugin..'complete-line')
-- l.vis_menu_lines = 4 -- default

local c = require(plugin..'complete-char')
