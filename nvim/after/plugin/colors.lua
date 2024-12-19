require('nightfox').setup({
  options = {
    transparent = true,
  }
})

vim.cmd [[colorscheme carbonfox ]]
vim.cmd [[highlight SpellBad cterm=bold,undercurl gui=bold,undercurl guisp=Red]]
