local M = {}

vim.api.nvim_set_hl(0, "WinBarPath", { bg = "#181825", fg = "#cdd6f4" })
vim.api.nvim_set_hl(0, "WinBarModified", { bg = "#181825", fg = "#ff3838" })

function M.eval()
	local file_path = vim.api.nvim_eval_statusline("%f", {}).str
	local modified = vim.api.nvim_eval_statusline("%m", {}).str == "[+]" and "  ⟴  " or ""
	file_path = file_path:gsub("/", " ➤ ")

	return "%#WinBarPath#" .. file_path .. "%*" .. "%#WinBarModified#" .. modified .. "%*"
end


return M
