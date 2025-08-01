return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',

  auto_install = require('nixCatsUtils').lazyAdd(true, false),

  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = ' '
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,

  opts = function()
    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str
      end,
    }

    local filename = {
      'filename',
      file_status = true,
      path = 0,
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        disabled_filetypes = {
          statusline = { 'snacks_explorer', 'snacks_dashboard' },
          winbar = {},
        },
        always_divide_middle = true,
        global_status = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_c = { filename },
      },
    }
  end,
}
