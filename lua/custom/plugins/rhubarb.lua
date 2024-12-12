return {
  'tpope/vim-rhubarb',
  config = function()
    vim.cmd [[
    let g:github_enterprise_urls = ['ghe.anduril.dev']
    ]]
    local line = debug.getinfo(1).currentline
  end,
}
