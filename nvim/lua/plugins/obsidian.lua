return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    command = 'Obsidian',
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    new_note_location = 'current_dir',
    prepend_note_id = true,
    mappings = {},
    workspaces = {
      {
        name = 'personal',
        path = '/Users/jan/Library/Mobile Documents/com~apple~CloudDocs/obsidian/second_brain',
      },
      -- {
      --   name = 'work',
      --   path = '~/vaults/work',
      -- },
    },
    templates = {
      subdir = 'Templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M',
      tags = '',
    },

    note_id_func = function(title)
      if title == nil then
        return tostring(os.date '%y%m%d%H%M%S')
      end
      return title
    end,
  },
}
