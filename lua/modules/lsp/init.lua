local status_ok, lspc = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "modules.lsp.setting"
