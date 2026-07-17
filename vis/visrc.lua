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
})

vis:command("set autoindent on")
