-- insert completion plugins: keyword, dictionary, line and character

local plugin = 'plugins/ins-completion/'

local d = require(plugin..'complete-dict')
local k = require(plugin..'complete-keyword')
-- dictfiles =  { 
-- 	path = '~/.local/share/dict/',
-- 	text = '/usr/share/words',
-- }

-- table.insert(k.completeopts.default, "shell command")
-- k.completeopts.text = { t = "echo some text for example", }
-- you can also insert functions (with only one argument)

local l = require(plugin..'complete-line')
-- l.vis_menu_lines = 4 -- default

local c = require(plugin..'complete-char')
