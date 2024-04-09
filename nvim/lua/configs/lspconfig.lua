-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  html = {},
  awk_ls = {},
  bashls = {},
  tsserver = {},
  rust_analyzer = {
    settings = {
        ['rust-analyzer'] = {
            check = {
                command = "clippy";
            },
            diagnostics = {
                enable = true;
            }
        }
    }
  },
  pyright = {
    settings = {

      python = {
        analysis = {
          autoImportCompletion = true,
          useLibraryCodeForTypes = true,
          autoSearchPaths = true,
          typeCheckingMode = "off",
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  opts.on_init = on_init
  opts.on_attach = on_attach
  opts.capabilities = capabilities

  lspconfig[name].setup(opts)
end

