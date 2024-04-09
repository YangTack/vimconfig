return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap, dapui = require "dap", require "dapui"
      dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },

  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db", "<cmd> DapToggleBreakpoint <CR>", desc = "Toggle Breakpoint" },
    },
  },
  -- {
  --   "theHamsta/nvim-dap-virtual-text",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "mfussenegger/nvim-dap",
  --   },
  --   config = function()
  --     require "configs.dap_virtual_text"
  --   end,
  -- },
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = { "python" },
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    keys = {
      {
        "<leader>dbr",
        function()
          require("dap").continue()
        end,
        desc = "Run Debug",
      },
    },
    config = function()
      local path = "python3"
      require("dap-python").setup(path)
    end,
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "python" },
    config = function()
      require "configs.null-ls"
    end,
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  --
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "pyright",
        "ruff",
        "black",
        "isort",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "python",
      },
    },
  },
}
