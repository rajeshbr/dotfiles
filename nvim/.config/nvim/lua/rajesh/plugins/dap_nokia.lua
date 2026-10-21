return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap')

      -- 1. Register the native Termux LLDB adapter
      dap.adapters.lldb = {
        type = 'executable',
        command = '/data/data/com.termux/files/usr/bin/lldb-dap', -- Native path in Termux
        name = 'lldb',
      }

       -- 1. Explicitly define TMUX as your external terminal handler over SSH
      dap.defaults.fallback.external_terminal = {
        command = 'tmux',
        -- Opens a horizontal split (side-by-side) taking up 40% of the screen space
        args = { 'split-window', '-h', '-p', '40' },
      }

      -- 2. Configure Rust to use that adapter
      dap.configurations.rust = {
        {
          name = 'Launch with Interactive Input',
          type = 'lldb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},

          -- 2. CRUCIAL CHANGE: "externalTerminal" tells DAP to use the tmux config above
          console = 'externalTerminal', 

        },
      }
    end
  }
}

