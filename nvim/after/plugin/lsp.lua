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
        'ruff_lsp',
        'verible',
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,

        verible = function()
            require('lspconfig').verible.setup({
                root_dir = function() return vim.loop.cwd() end
            })
        end,
    },
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
      experimental = {
        ghost_text = true,
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
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
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
