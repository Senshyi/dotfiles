local data = assert(vim.fn.stdpath "data") --[[@as string]]

require("telescope").setup {
  extensions = {
    fzf = {},
    wrap_results = true,
    history = {
      path = vim.fs.joinpath(data, "telescope_history.sqlite3"),
      limit = 100,
    },
  },
}

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "smart_history")

local builtin = require "telescope.builtin"

vim.keymap.set("n", "<space>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<space>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<space>sg", builtin.live_grep, { desc = "[S]earch [G]rep" })
vim.keymap.set("n", "<space>/", builtin.current_buffer_fuzzy_find, { desc = "fuzzy find current buffer" })
vim.keymap.set("n", "<space>sr", builtin.lsp_references, { desc = "[S]earch [R]eference" })

vim.keymap.set("n", "<space>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })

-- probably will not need
vim.keymap.set("n", "<space>sa", function()
  ---@diagnostic disable-next-line: param-type-mismatch
  builtin.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath "data", "lazy") }
end, { desc = "search lazy" })
