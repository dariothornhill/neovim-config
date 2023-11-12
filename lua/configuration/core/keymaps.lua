local ok, wk = pcall(require, "which-key")
if not ok then
	return
end

-- space as leader key
vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- normal mode mappings
local n_opts = {
	mode = "n",
	prefix = "",
	silent = true,
	noremap = true,
	nowait = true,
}

wk.register({
	-- trouble
	["<leader>x"] = {
		name = "[Trouble]",
		x = {
			function()
				require("trouble").open()
			end,
			"Open trouble window",
		},
		w = {
			function()
				require("trouble").open("workspace_diagnostics")
			end,
			"Workspace diagnostics",
		},
		q = {
			function()
				require("trouble").open("document_diagnostics")
			end,
			"Document diagnostics",
		},
		d = {
			function()
				require("trouble").open("quickfix")
			end,
			"Quick fix suggestions",
		},
		l = {
			function()
				require("trouble").open("loclist")
			end,
			"Loc List",
		},
		r = {
			function()
				require("trouble").open("lsp_references")
			end,
			"LSP references",
		},
	},

	-- motions
	["<leader>m"] = {
		name = "[Motions]",
		H = { "^", "[MOTION] Move to first character of line" },
		L = { "$", "[MOTION] Move to last character of line" },
		W = { "<cmd>lua require('spider').motion('w')<CR>", "[MOTION] Spider-w motion" },
		B = { "<cmd>lua require('spider').motion('b')<CR>", "[MOTION] Spider-b motion" },
		E = { "<cmd>lua require('spider').motion('e')<CR>", "[MOTION] Spider-e motion" },
		gE = { "<cmd>lua require('spider').motion('ge')<CR>", "[MOTION] Spider-ge motion" },
	},

	-- views
	["<leader>v"] = {
		name = "[Views]",
		d = { "<cmd>lua require'dapui'.toggle()<CR>", "[TOGGLEDEBUGGERUI] Toggle debugger UI" }, -- show the debugger UI
		f = { ":NvimTreeToggle<CR>", "[TOGGLEVIMTREE] Open vim tree" }, -- open file explorer vim tree
		t = { "<cmd>ToggleTerm<CR>", "[TOGGLETERM] Open new terminal" }, -- open the teminal
		u = { "<cmd>UndotreeToggle<CR>", "[UNDOTREE] Toggle undo tree" }, -- opne undo terminal

		v = { "<C-w>v", "Split window vertically" }, -- split window vertically
		h = { "<C-w>s", "Split window horizontally" }, -- split window horizontally
		e = { "<C-w>=", "Make split windows equal width" }, -- make split windows equal width
		c = { ":close<CR>", "Close current split window" }, -- close current split window

		o = { ":tabnew<CR>", "Open new tab" }, -- open new tab
		x = { ":tabclose<CR>", "Close current tab" }, -- close current tab
		n = { ":tabn<CR>", "Go to next tab" }, -- go to next tab
		p = { ":tabp<CR>", "Go to previous tab" }, -- go to previous tab
		l = { ":Twilight<CR>", "Toggle twilight" },
		tb = { ":TagbarToggle<CR>", "Toggle tag bar" },
	},

	-- telescope
	["<leader>f"] = {
		name = "[Telescope]",
		f = { "<cmd>Telescope find_files<CR>", "Find files" }, -- find files within current working directory, respects .gitignore
		s = { "<cmd>Telescope live_grep<CR>", "Live grep" }, -- find string in current working directory as you type
		c = { "<cmd>Telescope grep_string<CR>", "Grep string" }, -- find string under cursor in current working directory
		b = { "<cmd>Telescope buffers<CR>", "List buffers" }, -- list open buffers in current neovim instance
		h = { "<cmd>Telescope help_tags<CR>", "List help tags" }, -- list available help tags
	},

	-- telescope git
	["<leader>t"] = {
		name = "[Telescope Git]",
		c = { "<cmd>Telescope git_commits<CR>", "List all git commits" }, -- list all git commits (use <cr> to checkout) ["gc" for git commits]
		f = { "<cmd>Telescope git_bcommits<CR>", "List commits for current file" }, -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
		b = { "<cmd>Telescope git_branches<CR>", "List git branches" }, -- list git branches (use <cr> to checkout) ["gb" for git branch]
		s = { "<cmd>Telescope git_status<CR>", "List current changes per file" }, -- list current changes per file with diff preview ["gs" for git status]
	},

	-- code navigation
	["<leader>c"] = {
		name = "[Code Navigation]",
		d = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
		D = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
		t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Go to type definition" },
		i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation" },
		s = { "<cmd>lua require'jdtls'.super_implementation()<CR>", "Go to super implementation" },
		r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Show references" },
		a = { "<cmd>AerialToggle!<CR>", "Toggle aerial" },
	},

	-- reformat
	["<leader>r"] = {
		name = "[Reformat]",
		f = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format the code" }, -- format the code
		n = { "<cmd>Lspsaga rename<CR>", "Rename" }, -- rename
		e = { "<cmd>Lspsaga code_action<CR>", "Show code actions" }, -- show code actions
	},

	-- errors and diagnostics
	["<leader>e"] = {
		name = "[Diagnostics]",
		n = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "[DIAG] Go to next error" },
		p = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "[DIAG] Go to previous error" },
	},

	-- git
	["<leader>g"] = {
		name = "[Git]",
		d = { "<cmd>Gitsigns diffthis<CR>", "[GIT] Diff" },
		n = { "<cmd>Gitsigns next_hunk<CR>", "[GIT] Next hunk" },
		p = { "<cmd>Gitsigns prev_hunk<CR>", "[GIT] Prev hunk" },
		h = { "<cmd>Gitsigns preview_hunk<CR>", "[GIT] Preview hunk" },
	},

	-- harpoon
	["<leader>h"] = {
		name = "[Harpoon]",
		a = {
			function()
				require("harpoon.mark").add_file()
			end,
			"Add file to harpoon",
		},
		u = {
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			"Toggle quick menu",
		},
		z = {
			function()
				require("harpoon.ui").nav_file(1)
			end,
			"Switch to file 1",
		},
		x = {
			function()
				require("harpoon.ui").nav_file(2)
			end,
			"Switch to file 2",
		},
		c = {
			function()
				require("harpoon.ui").nav_file(3)
			end,
			"Switch to file 3",
		},
		v = {
			function()
				require("harpoon.ui").nav_file(4)
			end,
			"Switch to file 4",
		},
	},

	-- debug
	["<leader>d"] = {
		name = "[Debug]",
		c = {
			function()
				require("dap").continue()
			end,
			"Continue debugging",
		},
		o = {
			function()
				require("dap").step_over()
			end,
			"Step over code",
		},
		i = {
			function()
				require("dap").step_into()
			end,
			"Step into code",
		},
		t = {
			function()
				require("dap").step_out()
			end,
			"Step out of the code",
		},
		b = {
			function()
				require("dap").toggle_breakpoint()
			end,
			"Toggle break point",
		},
		B = {
			function()
				require("dap").set_breakpoint()
			end,
			"Set break point",
		},
		L = {
			function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end,
			"Set break point with message",
		},
		r = {
			function()
				require("dap").repl.open()
			end,
			"Repl open",
		},
		l = {
			function()
				require("dap").run_last()
			end,
			"Run last",
		},
		h = {
			function()
				require("dap.ui.widgets").hover()
			end,
			"Hover",
		},
		p = {
			function()
				require("dap.ui.widgets").preview()
			end,
			"Preview",
		},
		f = {
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end,
			"Frames",
		},
		s = {
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end,
			"Scopes",
		},
	},
}, n_opts)

-- insert mode mappings
local i_opts = {
	mode = "i",
	prefix = "",
	silent = true,
	noremap = true,
	nowait = true,
}

wk.register({
	["jk"] = { "<Esc>", "Normal mode switch" },
	["<a-s>"] = { "<Del>", "Handy DEL on insert mode" },
	["<a-d>"] = { '<C-o>"_diw', "Delete word" },
	["<a-c>"] = { '<C-o>"_ciw', "Change word" },
	["<a-w>"] = { "<C-o>w", "Move to next word" },
	["<a-b>"] = { "<C-o>b", "Move to previous word" },
	["<a-e>"] = { "<ESC>ea", "Move to end of word" },
	["<a-j>"] = { "<ESC>:m .+1<cr>==gi", "[MOVE] Move block down" },
	["<a-k>"] = { "<ESC>:m .-2<cr>==gi", "[MOVE] Move block up" },
}, i_opts)

-- visual mode mappings
local v_opts = {
	mode = "v",
	nowait = true,
	prefix = "",
	silent = true,
	noremap = true,
}
wk.register({
	["jk"] = { "<Esc>", "Normal mode switch" },
	["<c-s>"] = { "ggOG", "[SELECT] Select all" },
	-- Edit
	["c"] = { '"_c', "Do not copy when changing" },
	["C"] = { '"_C', "Do not copy when changing" },
	["cc"] = { '"_cc', "Do not copy when changing" },
	["p"] = { '"_dP', "Paste without replacing what is was in clipboard" },
	["<a-j>"] = { ":m '>+1<cr>gv=gv", "[MOVE] Move block down" },
	["<a-k>"] = { ":m '<-2<cr>gv=gv", "[MOVE] Move block up" },
	-- Motions
	["H"] = { "^", "[MOTION] Move to first character of line" },
	["L"] = { "$", "[MOTION] Move to last character of line" },
	["<a-down>"] = { "<cmd>TSTextobjectGotoNextStart @function.outer<cr>", "[MOTION] Move to next method" },
	["<a-up>"] = { "<cmd>TSTextobjectGotoPreviousStart @function.outer<cr>", "[MOTION] Move to previous method" },
	["w"] = { "<cmd>lua require('spider').motion('w')<cr>", "[MOTION] Spider-w motion" },
	["e"] = { "<cmd>lua require('spider').motion('e')<cr>", "[MOTION] Spider-e motion" },
	["b"] = { "<cmd>lua require('spider').motion('b')<cr>", "[MOTION] Spider-b motion" },
	["E"] = { "<cmd>lua require('spider').motion('ge')<cr>", "[MOTION] Spider-ge motion" },

	["<"] = { "<gv", "[Indent] Indent left" },
	[">"] = { ">gv", "[Indent] Indent right" },
	["<leader>dx"] = { "<cmd>lua require('dapui').eval()<CR>", "[DAPUI] Evaluate (selection in visual mode) }" },

	dh = {
		function()
			require("dap.ui.widgets").hover()
		end,
		"",
	},
	dp = {
		function()
			require("dap.ui.widgets").preview()
		end,
		"",
	},
}, v_opts)

-- select mode mappings
local s_opts = {
	mode = "s",
	prefix = "",
	silent = true,
	noremap = true,
	nowait = true,
}
wk.register({
	["<a-Bs>"] = { "<C-o>diw", "Delete word" },
	["<a-c>"] = { "<C-o>ciw", "Change word" },
}, s_opts)

-- terminal mode mappings
local t_opts = {
	mode = "t",
	prefix = "",
	silent = true,
	noremap = true,
	nowait = true,
}
wk.register({
	["<c-h>"] = { "<cmd>wincmd h<cr>,", "[TERMINAL] Move left" },
	["<c-j>"] = { "<cmd>wincmd j<cr>,", "[TERMINAL] Move down" },
	["<c-k>"] = { "<cmd>wincmd k<cr>,", "[TERMINAL] Move up" },
	["<c-l>"] = { "<cmd>wincmd l<cr>,", "[TERMINAL] Move right" },
}, t_opts)

wk.setup({})

--------------------------------------------------------------------------------

local keymap = vim.keymap
keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
