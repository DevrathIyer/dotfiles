local lsp = require('lsp-zero').preset({})
local navic = require("nvim-navic")

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
    lsp.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
      })
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end

end)

lsp.ensure_installed({
    'pyright',
    'ruff_lsp'
})

lsp.configure("pyright", {
    handlers = {
        ["textDocument/publishDiagnostics"] = function() end,
    },
    on_attach = function(client, _)
        client.server_capabilities.codeActionProvider = false
    end,
    settings = {
        pyright = {
          disableOrganizeImports = true,
        },
        python = {
            analysis = {
                autoSearchPaths = true,
                typeCheckingMode = "basic",
                useLibraryCodeForTypes = true,
            },
        }
    }
})

lsp.setup()

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
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
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
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
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
          elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
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
