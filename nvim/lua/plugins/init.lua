return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre' -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua", "pyright", "rust-analyzer",
  			"html-lsp", "css-lsp" , "prettier"
  		},
  	},
  },
  {
    "FabijanZulj/blame.nvim"
  },
  {
    "lukoshkin/highlight-whitespace",
    config=true,
  }
}
