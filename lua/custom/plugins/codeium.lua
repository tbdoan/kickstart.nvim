return {
  'Exafunction/codeium.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },
  config = function()
    local options = {
      enterprise_mode = true,
      enable_chat = true,
      enable_cmp_source = false,
      virtual_text = {
        enabled = true,
      },
      api = {
        host = 'codeium.itools.anduril.dev',
        port = 443,
      },
    }

    require('codeium').setup(options)
  end,
}
