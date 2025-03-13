return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme "kanagawa"
    end,
  },
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = function()
      -- vim.g.gruvbox_material_background = "hard"
      -- vim.g.gruvbox_material_enable_italic = true
      -- vim.cmd.colorscheme "gruvbox-material"
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme "catppuccin-mocha"
    end,
  },
  {
    "datsfilipe/vesper.nvim",
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme "vesper"
    end,
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    -- config = function()
    --   require("everforest").setup {
    --     -- Your config here
    --     background = "hard",
    --   }
    --   vim.cmd.colorscheme "everforest"
    -- end,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    config = function()
      -- vim.cmd.colorscheme "oxocarbon"
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd.colorscheme "rose-pine"
    end,
  },
}
