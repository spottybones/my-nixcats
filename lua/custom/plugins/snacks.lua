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
    explorer = { enabled = true },
    dashboard = { enabled = true },
    image = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },

  -- stylua: ignore
  keys = {
    { '<leader>sh', function() Snacks.picker.help() end, desc = '[S]earch [H]elp', },
    { '<leader>sk', function() Snacks.picker.keymaps() end, desc = '[S]earch [K]eymaps', },
    { '<leader>sf', function() Snacks.picker.files() end, desc = '[S]earch [F]iles', },
    { '<leader>ss', function() Snacks.picker() end, desc = '[S]earch [S]elect Pickers', },
    { '<leader>sw', function() Snacks.picker.grep_word() end, desc = '[S]earch current [W]ord', },
    { '<leader>sg', function() Snacks.picker.grep() end, desc = '[S]earch by [G]rep', },
    { '<leader>sd', function() Snacks.picker.diagnostics() end, desc = '[S]earch [D]iagnostics', },
    { '<leader>sr', function() Snacks.picker.resume() end, desc = '[S]earch [R]esume', },
    { '<leader>s.', function() Snacks.picker.recent() end, desc = '[S]earch Recent Files ("." for repeat)', },
    { '<leader><leader>', function() Snacks.picker.buffers() end, desc = '[ ] Find existing buffers', },

    { '<leader>/', function() Snacks.picker.lines() end, desc = '[/] Fuzzily search in current buffer', },

    { '<leader>s/', function() Snacks.picker.grep_buffers() end, desc = '[S]earch [/] in Open Files', },

    -- Shortcut for searching your Neovim configuration files
    { '<leader>sn', function()
      Snacks.picker.files { cwd = vim.fn.stdpath 'config', title = 'Search Neovim Config Files' }
    end, desc = '[S]earch [N]eovim files', },

    -- open up LazyGit
    { '<leader>gg', function() Snacks.lazygit() end, desc = '[G] Open lazy[G]it', },

    -- open the file explorer
    { '\\', function() Snacks.explorer.open() end, desc = '[\\] Open File Explorer', },
  },
}
