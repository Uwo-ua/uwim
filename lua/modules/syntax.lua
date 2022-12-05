
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  ensure_installed = {
    "javascript",
    "typescript",
    "rust",
    "html",
    "lua",
    "v",
    "haskell",
    "css",
    "scss",
    "toml",
    "json",
    "astro",
    "vue",
    "yaml",
    "tsx",
    "nix"
  },
  highlight = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	indent = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
})



