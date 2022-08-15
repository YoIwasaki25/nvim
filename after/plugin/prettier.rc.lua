local status, prettier = pcall(require, "prettier")
if (not status) then return end

prettier.setup({
  bin = "prettierd",
  config_precedence = "prefer-file",
  filetypes = {
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "scss",
    "less"
  }
})
