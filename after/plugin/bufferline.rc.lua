local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

local highlights = require("nord").bufferline.highlights({
  italic = true,
  bold = true,
})

bufferline.setup({
  options = {
    mode = "buffers",
    separator_style = "thin",
    always_show_bufferline = true,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    diagnostics = "nvim_lsp"
  },
  highlights = highlights,
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
