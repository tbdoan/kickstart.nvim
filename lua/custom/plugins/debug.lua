return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-neotest/nvim-nio',
      'williamboman/mason.nvim',

      -- language specific
      'leoluz/nvim-dap-go',
      'jbyuki/one-small-step-for-vimkind',
    },
    config = function()
      local dap = require 'dap'
      local ui = require 'dapui'

      require('dapui').setup()
      require('dap-go').setup()

      require('nvim-dap-virtual-text').setup {}

      -- Change breakpoint icons
      vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
      vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
      local breakpoint_icons = vim.g.have_nerd_font
          and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
        or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
      for type, icon in pairs(breakpoint_icons) do
        local tp = 'Dap' .. type
        local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
        vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
      end

      -- Handled by nvim-dap-go
      -- dap.adapters.go = {
      --   type = "server",
      --   port = "${port}",
      --   executable = {
      --     command = "dlv",
      --     args = { "dap", "-l", "127.0.0.1:${port}" },
      --   },
      -- }
      dap.configurations.lua = {
        {
          type = 'nlua',
          request = 'attach',
          name = 'Attach to running Neovim instance',
        },
      }

      dap.adapters.nlua = function(callback, config)
        callback { type = 'server', host = config.host or '127.0.0.1', port = config.port or 8086 }
      end

      vim.keymap.set('n', '<leader>dl', function()
        require('osv').launch { port = 8086 }
      end, { noremap = true, desc = '[D]ebug: [L]aunch' })

      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = '[D]ebug: Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>dt', dap.run_to_cursor, { desc = '[D]ebug: Run Un[t]il' })

      -- Eval var under cursor
      vim.keymap.set('n', '<leader>d?', function()
        require('dapui').eval(nil, { enter = true })
      end, { desc = '[D]ebug: Eval' })

      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[D]ebug: [C]ontinue' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = '[D]ebug: Step [I]nto' })
      vim.keymap.set('n', '<CR>', dap.step_over, { desc = 'Debug: Step Over' })
      vim.keymap.set('n', '<leader>do', dap.step_out, { desc = '[D]ebug: Step [O]ut' })
      vim.keymap.set('n', '<leader>du', dap.step_back, { desc = '[D]ebug: Step Back ([U]ndo)' })
      vim.keymap.set('n', '<leader>d.', dap.restart, { desc = '[D]ebug: Restart' })
      vim.keymap.set('n', '<leader>dd', ui.toggle, { desc = '[D]ebug Mode Toggle' })

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
