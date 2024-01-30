return {
  {
    'ThePrimeagen/harpoon',
branch = "harpoon2",
    lazy = true,
dependencies = { "nvim-lua/plenary.nvim" },
    cofig = function()
      require('harpoon').setup()
    end,
  },
}
