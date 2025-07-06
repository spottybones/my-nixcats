-- Enable Snacks library
return {
  'folke/snacks.nvim',
  lazy = false,
  priority = 1000,
  auto_install = require('nixCatsUtils').lazyAdd(true, false),

  opts = {
    picker = {
      ui_select = true,
    },
    bigfile = { enabled = true },
    indent = { enabled = true },
    quickfile = { enabled = true },
  },
}
