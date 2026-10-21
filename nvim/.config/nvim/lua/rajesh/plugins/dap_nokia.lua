return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap')

      -- 1. Register the native Termux LLDB adapter
      dap.adapters.lldb = {
        type = 'executable',
        command = '/data/data/com.termux/files/usr/bin/lldb-dap', -- Native path in Termux
        name = 'lldb'
      }

      -- 2. Configure Rust to use that adapter
      dap.configurations.rust = {
        {
          name = 'Launch Target',
          type = 'lldb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
        },
      }
    end
  }
}

