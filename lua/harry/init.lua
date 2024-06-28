require("harry.set")
require("harry.remap")
require("harry.packer")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

require("tokyonight").setup {
	transparent = true,
	styles = {
		sizebars = "transparent",
		floats = "transparent",
	}
}

vim.cmd('colorscheme tokyonight-night')
--vim.cmd('colorscheme onehalflight')
