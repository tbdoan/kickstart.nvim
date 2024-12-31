return {
  'luukvbaal/statuscol.nvim',
  opts = function()
    local builtin = require 'statuscol.builtin'

    return {
      bt_ignore = { 'nofile', 'terminal' },
      segments = {
        {
          text = { builtin.foldfunc },
          click = 'v:lua.ScFa',
        },
        {
          sign = { namespace = { 'diagnostic/signs' }, maxwidth = 1, auto = false },
          condition = { true },
          click = 'v:lua.ScSa',
        },
        {
          text = { builtin.lnumfunc },
          condition = { true, builtin.not_empty },
          click = 'v:lua.ScLa',
        },
        {
          sign = { namespace = { 'gitsigns' }, colwidth = 1, wrap = true },
          click = 'v:lua.ScSa',
        },
      },
    }
  end,
}
