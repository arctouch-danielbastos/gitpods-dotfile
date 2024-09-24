-- Set leader key
vim.g.mapleader = " "

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.relativenumber = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'nosplit'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Hate having to do Shift + 6 for something so simple
vim.keymap.set({'n', 'o'}, '0', '^')
vim.keymap.set({'n', 'o'}, '^', '0')

-- Allows replacing with P without losing yank
vim.keymap.set('x', '<leader>p', '\"_dp')
vim.keymap.set('x', '<leader>P', '\"_dP')
vim.keymap.set('x', '<leader>d', '\"_dd')
vim.keymap.set('x', '<leader>D', '\"_dD')
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")

-- [[ Basic Autocommands ]]

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { 
        -- Table with textobject id as fields, textobject specification as values.
        -- Also use this to disable builtin textobjects. See |MiniAi.config|.
        custom_textobjects = nil,

        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          goto_left = 'gb',
          goto_right = 'ga',
        },

        -- Number of lines within which textobject is searched
        n_lines = 50,
      }

      require('mini.surround').setup() 

      require('mini.jump').setup {
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          forward = 'f',
          backward = 'F',
          forward_till = 't',
          backward_till = 'T',
          repeat_jump = ';',
        },
      
        -- Delay values (in ms) for different functionalities. Set any of them to
        -- a very big number (like 10^7) to virtually disable.
        delay = {
          -- Delay between jump and highlighting all possible jumps
          highlight = 100,
      
          -- Delay between jump and automatic stop if idle (no jump is done)
          idle_stop = 2500,
        },
      }
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "<leader><leader>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {},
  }
}, {})

