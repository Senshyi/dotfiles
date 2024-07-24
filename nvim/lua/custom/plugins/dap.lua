return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require "dap"
      local ui = require "dapui"

      require("dapui").setup()
      require("dap-go").setup()

      require("nvim-dap-virtual-text").setup()

      -- dap.adapters.lldb = {
      --   type = "executable",
      --   command = vim.fn.stdpath "data" .. "/mason/bin/codelldb",
      --   name = "lldb",
      --   host = "127.0.0.1",
      --   port = 13000,
      -- }
      --
      -- dap.configurations.rust = {
      --   {
      --     name = "Launch",
      --     type = "lldb",
      --     request = "launch",
      --     program = function()
      --       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      --     end,
      --     cwd = "${workspaceFolder}",
      --     stopOnEntry = false,
      --     args = {},
      --     -- ... the previous config goes here ...,
      --     -- initCommands = function()
      --     --   -- Find out where to look for the pretty printer Python module
      --     --   local rustc_sysroot = vim.fn.trim(vim.fn.system "rustc --print sysroot")
      --     --
      --     --   local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
      --     --   local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"
      --     --
      --     --   local commands = {}
      --     --   local file = io.open(commands_file, "r")
      --     --   if file then
      --     --     for line in file:lines() do
      --     --       table.insert(commands, line)
      --     --     end
      --     --     file:close()
      --     --   end
      --     --   table.insert(commands, 1, script_import)
      --     --
      --     --   return commands
      --     -- end,
      --     -- ...,
      --   },
      -- }

      vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

      -- Eval var under cursor
      vim.keymap.set("n", "<space>?", function()
        require("dapui").eval(nil, { enter = true })
      end)

      vim.keymap.set("n", "<F1>", dap.continue)
      vim.keymap.set("n", "<F2>", dap.step_into)
      vim.keymap.set("n", "<F3>", dap.step_over)
      vim.keymap.set("n", "<F4>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.step_back)
      vim.keymap.set("n", "<F13>", dap.restart)

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
