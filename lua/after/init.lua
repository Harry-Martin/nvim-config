local colorbuddy = require('colorbuddy')

colorbuddy.colorscheme("noirbuddy")

local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local groups = colorbuddy.groups
local styles = colorbuddy.styles


-- use color.new(<name>, <#rrggbb>) to create new colors
-- they can be accessed through colors.<name>
-- Color.new('background',  '#282c34')
-- Color.new('red',         '#ff0000')
-- Color.new('green',       '#00ff00')
-- Color.new('yellow',      '#f0c674')
Color.new('harry',      '#ff0000')
Color.new('primary',      '#c2a200')

Group.new('@type.builtin', colors.harry, colors.background, styles.bold)
--
-- -- Define highlights in terms of `colors` and `groups`
-- Group.new('Function'        , colors.yellow      , colors.background , styles.bold)
-- Group.new('luaFunctionCall' , groups.Function    , groups.Function   , groups.Function)
--
-- -- Define highlights in relative terms of other colors
-- Group.new('Error'           , colors.red:light() , nil               , styles.bold)
--
-- -- If you want multiple styles, just add them!
-- Group.new('italicBoldFunction', colors.green, groups.Function, styles.bold + styles.italic)
--
-- -- If you want the same style as a different group, but without a style: just subtract it!
-- Group.new('boldFunction', colors.yellow, colors.background, groups.italicBoldFunction - styles.italic)
--
--
--
--vim.cmd.colorscheme("noirbuddy")
