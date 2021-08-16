## Vis insert completion
Basic [insert mode completion](https://vimhelp.org/insert.txt.html#ins-completion)
for the [vis editor](https://github.com/martanne/vis/).

### Complete Methods
* line completion:
  - mapped to `<C-x><C-l>`
* character completion:
  - mapped to `<C-Up>` and `<C-Down>`
  - in vim this is mapped to [`<C-E>`](https://vimhelp.org/scroll.txt.html#CTRL-E) and [`<C-Y>`](https://vimhelp.org/scroll.txt.html#CTRL-Y)
* dictionary completion:
  - mapped to `<C-x><C-k>`
  - dictionary must be a new-line separated list of items.
  - [wl.sh](https://github.com/jpaulogg/scripts/blob/master/wl.sh) is a helper that reads from stdin and prints a new-line separated list of words/WORDS to stdout
  - default dictionary path is `~/.local/share/dict/{syntax}`.
  - syntaxes names are the same defined by the [filetype.lua plugin](https://github.com/martanne/vis/blob/master/lua/plugins/filetype.lua)
* keyword completion:
  - mapped to `<C-n>`. **Note that this will overwrite standard word completion** [mapping](https://github.com/martanne/vis/blob/master/lua/plugins/complete-word.lua)
  - this method combine the output of shell commands in the [completeopts](init.lua#L12-L13) table.
  - the default behaviour is to combine word completion and dictionary completion.

### vis-complete branch
Line completion wont work properly if the first characters are meta-characters.
This is fixed in the vis-complete branch, but you will need to use [my version
of vis-complete](https://github.com/martanne/vis/pull/959). With this, vis-complete
can be used to complete text objects other than short words (in addition to other improvements).

### Configuration
You can set some options from [init.lua](init.lua) file or from your visrc.lua:
* [the path used to load the plugins](init.lua#L3)
* [path to dictionary files](init.lua#L7-L10) - dictionary and keyword completion
* [list of shell commands](init.lua#L12-L14) - used by keyword completion method.
* [number of lines](init.lua#L17) in vis-menu - line completion

### Installation
Each script can be instaled separetaly. For example:
```bash
mkdir -p ~/.config/vis/plugins
cd ~/.config/vis/plugins
curl -O https://raw.githubusercontent.com/jpaulogg/vis-ins-completion/master/complete-dict.lua
```
In your visrc.lua:
```lua
require("plugins/complete-dict")
```

To install all scripts
```bash
mkdir -p ~/.config/vis/plugins
cd ~/.config/vis/plugins
git clone https://github.com/jpaulogg/vis-ins-completion
```
```lua
require("plugins/vis-ins-completion")
```