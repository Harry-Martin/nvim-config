return {
	'VonHeikemen/lsp-zero.nvim',
	dependencies = {
		{'neovim/nvim-lspconfig'},
		{'williamboman/mason.nvim'},
		{'williamboman/mason-lspconfig.nvim'},

		{'hrsh7th/nvim-cmp'},
		{'hrsh7th/cmp-buffer'},
		{'hrsh7th/cmp-path'},
		{'saadparwaiz1/cmp_luasnip'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/cmp-nvim-lua'},

		{'L3MON4D3/LuaSnip'},
		{'rafamadriz/friendly-snippets'},
	},
	config = function()
		local lsp = require("lsp-zero")


		lsp.on_attach(function(client, bufnr)
			local opts= {buffer = bufnr, remap = false}

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
			vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts)
		end)

		require('mason').setup({})
		require('mason-lspconfig').setup({
			ensure_installed = { "clangd", "lua_ls"},
			handlers = {
				function(server_name)
					require('lspconfig')[server_name].setup({})
				end,

				lua_ls = function()
					require('lspconfig').lua_ls.setup({
						settings = {
							Lua = {}
						},
						on_init = function(client)
							local uv = vim.uv
							local path = client.workspace_folders[1].name

							-- Don't do anything if there is a project local config
							if uv.fs_stat(path .. '/.luarc.json')
								or uv.fs_stat(path .. '/.luarc.jsonc')
							then
								return
							end

							-- Apply neovim specific settings
							local lua_opts = lsp.nvim_lua_ls()

							client.config.settings.Lua = vim.tbl_deep_extend(
								'force',
								client.config.settings.Lua,
								lua_opts.settings.Lua
							)
						end,
					})
				end
			},
		})

		local cmp = require('cmp')

		cmp.setup({
			completion = {
				autocomplete = false
			},
			sources = {
				{name = 'nvim_lsp'},
				{name = 'buffer'},
			},
			mapping = {
				['<C-u>'] = cmp.mapping.scroll_docs(-4),
				['<C-d>'] = cmp.mapping.scroll_docs(4),
				['<C-y>'] = cmp.mapping.confirm({select = false}),
				['<C-e>'] = cmp.mapping.abort(),
				['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
				['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
				['<C-p>'] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_prev_item({behavior = 'insert'})
					else
						cmp.complete()
					end
				end),
				['<C-n>'] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_next_item({behavior = 'insert'})
					else
						cmp.complete()
					end
				end),
			},
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
		})

	end
}
