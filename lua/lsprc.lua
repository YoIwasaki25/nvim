local on_attach = function(client, bufnr)
  -- LSPサーバーのフォーマット機能を無効にするには下の行をコメントアウト
  -- 例えばtypescript-language-serverにはコードのフォーマット機能が付いているが代わりにprettierでフォーマットしたいときなどに使う
  -- client.resolved_capabilities.document_formatting = false

  local set = vim.keymap.set
  -- -- set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  -- -- set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  -- set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  -- -- set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  -- set("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
  -- set("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
  -- set("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
  -- set("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  -- set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  -- set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  -- set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  -- set("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
  -- -- set("n", "<leader>[", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
  -- -- set("n", "<leader>]", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
  -- set("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
  -- set("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
end

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      on_attach = on_attach
    } end,
}

-- lspconfig[server.name].setupに追加
capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local cmp = require "cmp"
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    [";;"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  })
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]

local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      -- with_text = false,
      mode = 'symbol_text',
      maxwidth = 80, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function(entry, vim_item)
        return vim_item
      end
    })
  }
}
