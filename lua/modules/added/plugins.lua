local added = {}
local conf = require("modules.added.config")

added["numToStr/Navigator.nvim"] = {
	opt = true,
	event = "VimEnter",
	config = function()
		require("Navigator").setup()
		vim.keymap.set("n", "<C-h>", "<CMD>NavigatorLeft<CR>")
		vim.keymap.set("n", "<C-l>", "<CMD>NavigatorRight<CR>")
		vim.keymap.set("n", "<C-k>", "<CMD>NavigatorUp<CR>")
		vim.keymap.set("n", "<C-j>", "<CMD>NavigatorDown<CR>")
	end,
}
added["askfiy/nvim-picgo"] = {
	opt = true,
	ft = "markdown",
	config = function()
		require("nvim-picgo").setup()
	end,
}
added["lervag/vimtex"] = {
	config = conf.vimtex,
}
added["dccsillag/magma-nvim"] = {
	opt = true,
	ft = "python",
	run = ":UpdateRemotePlugins",
	config = conf.magma,
}
added["MortenStabenau/matlab-vim"] = {
	opt = true,
	ft = "matlab",
	config = function()
		vim.cmd([[let g:matlab_executable = '/usr/bin/matlab']])
		vim.cmd([[let g:matlab_panel_size = 50]])
		vim.cmd([[let g:matlab_auto_start = 0]])
	end,
}
-- added["molleweide/LuaSnip-snippets.nvim"] = {
-- 	opt = true,
-- 	after = "LuaSnip",
-- }
added["lewis6991/impatient.nvim"] = {
	opt = false,
}
added["jczhang02/luasnips-mathtex-snippets"] = {
	config = function()
		vim.cmd([[packadd LuaSnip]])
		vim.cmd([[packadd vimtex]])
		vim.cmd([[packadd vim-markdown]])
		require("luasnip-latex-snippets").setup({
			use_treesitter = true,
		})
		-- or setup({ use_treesitter = true })
	end,
	ft = { "tex", "markdown" },
}
added["ii14/emmylua-nvim"] = {
	opt = true,
}
added["skywind3000/asyncrun.vim"] = {
	opt = true,
	cmd = "AsyncRun",
	config = function()
		vim.g.asyncrun_open = 10
	end,
}
added["skywind3000/asynctasks.vim"] = {
	opt = true,
	cmd = "AsyncTask",
	config = function()
		vim.g.asynctask_rootmarks = { ".git", "pyproject.toml" }
	end,
}
added["preservim/vimux"] = {
	opt = true,
	after = "asyncrun.vim",
	config = function()
		vim.g.VimuxHeight = "20"
		vim.cmd([[let g:VimuxCloseOnExit = 1]])
	end,
}
added["danymat/neogen"] = {
	opt = false,
	config = function()
		require("neogen").setup({
			-- snippet_engine = "luasnip",
			languages = {
				python = {
					template = {
						annotation_convertion = "numpydoc",
					},
				},
			},
		})
	end,
	requires = "nvim-treesitter/nvim-treesitter",
}
added["lambdalisue/suda.vim"] = {
	opt = false,
	config = function()
		vim.g.suda_smart_edit = 1
	end,
}
added["ludovicchabant/vim-gutentags"] = {
	opt = false,
	config = function()
		vim.g.gutentags_generate_on_new = 1
		vim.g.gutentags_generate_on_write = 1
		vim.g.gutentags_generate_on_missing = 1
		vim.g.gutentags_generate_on_empty_buffer = 0
		vim.g.gutentags_ctags_tagfile = ".tags"
	end,
}
added["preservim/vim-markdown"] = {
	opt = true,
	ft = "markdown",
	config = function()
		vim.cmd([[let g:vim_markdown_math = 1]])
	end,
}
added["kevinhwang91/nvim-hlslens"] = {
	opt = false,
	config = function()
		require("hlslens").setup()

		local kopts = { noremap = true, silent = true }

		vim.api.nvim_set_keymap(
			"n",
			"n",
			[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
			kopts
		)
		vim.api.nvim_set_keymap(
			"n",
			"N",
			[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
			kopts
		)
		vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

		vim.api.nvim_set_keymap("n", "<Leader>l", ":noh<CR>", kopts)
	end,
}
added["kylechui/nvim-surround"] = {
	keys = { "<C-g>s", "<C-g>S", "sa", "ssa", "sA", "ssA", "sa", "sA", "sd", "sr" },
	config = function()
		require("nvim-surround").setup({
			keymaps = {
				insert = "<C-g>s",
				insert_line = "<C-g>S",
				normal = "sa",
				normal_cur = "ssa",
				normal_line = "sA",
				normal_cur_line = "ssA",
				visual = "sa",
				visual_line = "sA",
				delete = "sd",
				change = "sr",
			},
		})
	end,
}
added["nvim-neo-tree/neo-tree.nvim"] = {
	branch = "v2.x",
	requires = {
		"nvim-lua/plenary.nvim",
		"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("modules.added.neotree")
	end,
}
added["simrat39/symbols-outline.nvim"] = {
	opt = true,
	cmd = { "SymbolsOutline" },
	config = function()
		require("modules.added.symboloutline")
	end,
}
return added
