local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
    lsp.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
      })
end)

vim.diagnostic.config({
    update_in_insert = true,
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'ruff',
        'verible',
    },
})

vim.lsp.config('ruff', {
  settings = { },
})


local cmp = require('cmp')

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

cmp.setup({
    completion = {
        completeopt = "menu,menuone",
      },
      window = {
        completion = {
          side_padding = 0,
          winhighlight = "Normal:CmpPmenu,Search:PmenuSel",
          scrollbar = false,
        },
        documentation = {
          border = border "CmpDocBorder",
          winhighlight = "Normal:CmpDoc",
        },
      },
      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-h>"] = cmp.mapping.scroll_docs(-4),
        ["<C-l>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
      },

    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
      },

    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(_, item)
            local lspkind = require('lspkind')
            local icon = lspkind.symbol_map[item.kind]

            icon = " " .. icon .. " "
            item.menu = "   (" .. item.kind .. ")" or ""
            item.kind = icon

            return item
        end,
	}
})
