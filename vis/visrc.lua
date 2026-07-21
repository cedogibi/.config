require('vis')

local plug = (function()
    if not pcall(require, 'plugins/vis-plug') then
        os.execute('git clone --quiet https://github.com/erf/vis-plug ' .. (os.getenv('XDG_CONFIG_HOME') or os.getenv('HOME') .. '/.config') .. '/vis/plugins/vis-plug')
    end
    return require('plugins/vis-plug')
end)()

plug.init({
    { url = 'https://codeberg.org/luxanna/vis-autoclose' },
    { url = 'https://codeberg.org/muhq/vis-lspc'},
    { url = 'https://git.sr.ht/~mcepl/vis-fzf-open' },
})

local plugin_vis_open = require('plugins/vis-fzf-open')
plugin_vis_open.fzf_path = (
    "FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g \"\"' fzf"
)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
    vis:command('set autoindent on')
    vis:command('map! normal <C-p> :fzf<Enter>')
    vis:command("set tabwidth 4")
    vis:command("set expandtab off")
end)
