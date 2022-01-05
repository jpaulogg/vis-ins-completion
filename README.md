## Vis insert completion
Basic [insert mode completion](https://vimhelp.org/insert.txt.html#ins-completion)
for the [vis editor](https://github.com/martanne/vis/). Works in insert and replace
modes and supports multiple selections.

### Complete Methods
* line completion:
  - mapped to `<C-x><C-l>`
* character completion:
  - mapped to `<C-Up>` and `<C-Down>`
  - in vim this is mapped to [`<C-E>`](https://vimhelp.org/scroll.txt.html#CTRL-E) and [`<C-Y>`](https://vimhelp.org/scroll.txt.html#CTRL-Y)
  - need some improvements, specially to handle multi-byte characters.
* dictionary completion:
  - mapped to `<C-x><C-k>`
  - dictionary must be a new-line separated list of items.
  - [wl.sh](https://github.com/jpaulogg/scripts/blob/master/wl.sh) is a helper that reads from stdin and prints a new-line separated list of words/WORDS to stdout
  - default dictionary path: `~/.local/share/dict/{syntax}`.
  - syntaxes names are the same defined by the [filetype.lua plugin](https://github.com/martanne/vis/blob/master/lua/plugins/filetype.lua)
* keyword completion:
  - mapped to `<C-n>`. **Note that this will overwrite standard word completion** [mapping](https://github.com/martanne/vis/blob/master/lua/plugins/complete-word.lua)
  - this method combine the output of shell commands in the [completeopts](complete-keyword.lua#L4-L13) table.
  - the default behaviour is to combine word completion and dictionary completion.

### Configuration
You can set some options from [init.lua](init.lua) file or from your visrc.lua:
* [the path used to load the plugins](init.lua#L3)
* [path to dictionary files](init.lua#L10-L13) - dictionary and keyword completion
* [number of lines](init.lua#L15) in vis-menu - line completion
* [list of shell commands](init.lua#L17-L19) - used by keyword completion method.

### Installation
Each script can be instaled separetaly. For example:
```bash
mkdir -p ~/.config/vis/plugins
cd ~/.config/vis/plugins
curl -O https://raw.githubusercontent.com/jpaulogg/vis-ins-completion/master/complete-dict.lua
echo 'require("plugins/complete-dict")' >> ../visrc.lua
```

To install all scripts:
```bash
mkdir -p ~/.config/vis/plugins
cd ~/.config/vis/plugins
git clone https://github.com/jpaulogg/vis-ins-completion
echo 'require("plugins/vis-ins-completion")' >> ../visrc.lua
```
