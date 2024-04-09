-- EXAMPLE
local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- lspconfig["pylsp"].setup {
--   on_init = on_init,
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = util.root_pattern ".git",
--   -- cmd = { "/home/y/.local/bin/pylsp" },
--   settings = {
--     pylsp = {
--       plugins = {
--         -- formatter options
--         black = { enabled = true },
--         autopep8 = { enabled = false },
--         yapf = { enabled = false },
--         -- linter options
--         pylint = { enabled = false, executable = "pylint" },
--         pyflakes = { enabled = false },
--         pycodestyle = { enabled = false },
--         -- type checker
--         pylsp_mypy = { enabled = true },
--         -- auto-completion options
--         ruff = { enabled = true, formatEnabled = false },
--         -- import sorting
--         pyls_isort = { enabled = true },
--         rope_autoimport = {
--           enabled = true,
--           completions = { enabled = true },
--           code_actions = { enabled = true },
--         },
--         rope_completion = {
--           enabled = false,
--         },
--         pyre = {
--           enabled = false,
--         },
--       },
--     },
--   },
-- }

lspconfig["pyright"].setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern ".git",
  settings = {
    python = {
      -- pythonPath = '/usr/local/bin/python3.11',
      analysis = {
        typeCheckingMode = "on",
      },
    },
  },
}

-- lspconfig["pyre"].setup {
--   on_init = on_init,
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = util.root_pattern ".git",
-- }
--
-- require('lspconfig').ruff_lsp.setup {
--   root_dir = util.root_pattern ".git",
--   cmd = { "/home/y/.local/bin/ruff-lsp" },
--   init_options = {
--     settings = {
--       -- Any extra CLI arguments for `ruff` go here.
--       args = {},
--     }
--   }
-- }
