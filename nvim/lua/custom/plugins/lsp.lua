return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim", opts = {} },

      -- autoformat
      "stevearc/conform.nvim",

      -- schema info
      "b0o/SchemaStore.nvim",
    },
    config = function()
      require("neodev").setup {}

      local capabilities = nil
      if pcall(require, "cmp_nvim_lsp") then
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      end

      local lspconfig = require "lspconfig"

      local servers = {
        bashls = true,
        gopls = true,
        lua_ls = true,
        rust_analyzer = true,
        templ = true,
        cssls = true,
        -- TODO: disable formatting
        tsserver = true,

        jsonls = {
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        },

        yamlls = {
          settings = {
            yaml = {
              schemas = require("schemastore").yaml.schemas(),
              validate = { enable = true },
            },
          },
        },
      }

      local servers_to_install = vim.tbl_filter(function(key)
        local t = servers[key]
        if type(t) == "table" then
          return not t.manual_install
        else
          return t
        end
      end, vim.tbl_keys(servers))

      require("mason").setup()
      local ensure_installed = {
        "stylua",
        "lua_ls",
      }

      vim.list_extend(ensure_installed, servers_to_install)
      require("mason-tool-installer").setup { ensure_installed = ensure_installed }

      for name, config in pairs(servers) do
        if config == true then
          config = {}
        end
        config = vim.tbl_deep_extend("force", {}, {
          capabilities = capabilities,
        }, config)

        lspconfig[name].setup(config)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

          vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]o to [D}efinition", buffer = 0 })
          vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "[G]o to [R]eference", buffer = 0 })
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]o to [D]eclaration", buffer = 0 })
          vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { desc = "[G]o to [T]ype definition", buffer = 0 })
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

          vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { desc = "[C]ode [R]ename", buffer = 0 })
          vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction", buffer = 0 })
        end,
      })

      require("conform").setup {
        formatters_by_ft = {
          lua = { "stylua" },
        },
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function(args)
          require("conform").format {
            bufnr = args.buf,
            lsp_fallback = true,
            quit = true,
          }
        end,
      })
    end,
  },
}
