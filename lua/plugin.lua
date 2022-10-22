local fn = vim.fn
local cmd = vim.cmd

-- My path install plugin
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Install
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer ...")
	vim.cmd([[packadd packer.nvim]])
end

cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	snapshot_path = fn.stdpath("config") .. "/snapshots",
	max_jobs = 50,
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
		prompt_border = "rounded",
	},
})

-- Plugin list
return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")

	-- Icon

	use({ "kyazdani42/nvim-web-devicons", opt = true })

	-- Themes

	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
		end,
	})

	-- Telescope

	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })
	use("nvim-telescope/telescope-file-browser.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use("tom-anders/telescope-vim-bookmarks.nvim")

	-- Lualine

	use({ "nvim-lualine/lualine.nvim" })

	-- Lsp

	use({ "neovim/nvim-lspconfig" })
	use({ "tamago324/nlsp-settings.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "williamboman/mason.nvim" })

	use({ "SmiteshP/nvim-navic" })

	use({ "glepnir/lspsaga.nvim" })

	use({ "onsails/lspkind.nvim" })

  use({ "rafamadriz/friendly-snippets" })

	use({ 
    "L3MON4D3/LuaSnip",
    after = "nvim-cmp",
  })

  use({ 'yaegassy/coc-volar' })

	-- Completion

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			-- CMP Sources
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-cmdline",
			"f3fora/cmp-spell",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-emoji",
			"s1n7ax/nvim-ts-utils",
			"s1n7ax/nvim-snips",
		},
	})

	use({ "numToStr/Comment.nvim" })

	-- Treesitter

	use("nvim-treesitter/nvim-treesitter")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/playground")
	use("windwp/nvim-ts-autotag")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("kylechui/nvim-surround")
	use({
		"abecodes/tabout.nvim",
		wants = { "nvim-treesitter" },
	})

	-- Auto pairs

	use({ "windwp/nvim-autopairs" })

	-- Terminal

	use({ "akinsho/toggleterm.nvim", tag = "*" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
