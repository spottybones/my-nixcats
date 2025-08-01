-- Enable Snacks library
return {
  'folke/snacks.nvim',
  event = 'VimEnter',
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

  config = function()
    local builtin = require 'snacks.picker'
    vim.keymap.set('n', '<leader>sh', function()
      builtin.help()
    end, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', function()
      Snacks.picker.keymaps()
    end, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', function()
      Snacks.picker.files()
    end, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', function()
      Snacks.picker()
    end, { desc = '[S]earch [S]elect Pickers' })
    vim.keymap.set('n', '<leader>sw', function()
      Snacks.picker.grep_word()
    end, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', function()
      Snacks.picker.grep()
    end, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', function()
      Snacks.picker.diagnostics()
    end, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', function()
      Snacks.picker.resume()
    end, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', function()
      Snacks.picker.recent()
    end, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', function()
      Snacks.picker.buffers()
    end, { desc = '[ ] Find existing buffers' })

    vim.keymap.set('n', '<leader>/', function()
      Snacks.picker.lines()
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>s/', function()
      Snacks.picker.grep_buffers()
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      Snacks.picker.files { cwd = vim.fn.stdpath 'config', title = 'Search Neovim Config Files' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
