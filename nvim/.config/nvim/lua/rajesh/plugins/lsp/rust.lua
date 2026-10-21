return {
  -- 1. Configure rustaceanvim
  {
    'mrcjkb/rustaceanvim',
    version = '^9', -- Recommended version range
    lazy = false,   -- This plugin is already lazy-loaded
    config = function()
      -- Termux specific settings (Optional customization)
      vim.g.rustaceanvim = {
        server = {
          -- By default, it picks up 'rust-analyzer' from your native Termux PATH.
          -- If it fails to find it, uncomment the line below to hardcode the path:
          cmd = function() return { "rust-analyzer" } end,
          
          settings = {
            ['rust-analyzer'] = {
              check = {
                command = "clippy", -- Use clippy for linting
              },
            },
          },
        },
      }
    end
  },

  -- 2. Prevent Mason from managing rust-analyzer
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      -- Ensure rust_analyzer is NOT in your ensure_installed list
      ignore_install = { "rust_analyzer" }, 
    }
  }
}

