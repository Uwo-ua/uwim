

local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

local lspconfig_configs = require'lspconfig.configs'

on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

--[[
  Language servers setup:
  For language servers list see:
  Language server installed:
  Bash          -> bashls
  Lua           -> sumneko_lua
  Python        -> pyright
  C-C++         -> clangd
  HTML/CSS/JSON -> vscode-html-languageserver
  JavaScript/TypeScript -> tsserver
--]]

local root_dir = function()
  return vim.fn.getcwd()
end

local servers = { 'sumneko_lua', 'bashls', 'pyright', 'clangd', 'html', 'cssls', 'tsserver', "vuels", "terraform_lsp" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    root_dir = root_dir,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

lspconfig.eslint.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue" }
}

lspconfig.volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}


