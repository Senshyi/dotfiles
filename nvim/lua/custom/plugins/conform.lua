return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cF",
      function()
        require("conform").format({ lsp_fallback = "always" })
      end,
      mode = { "n", "v" },
      desc = "Format Code",
    },
  },
}
