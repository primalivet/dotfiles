return { 
  setup = function()
    -- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
    local path_package = vim.fn.stdpath('data') .. '/site/'
    local mini_path = path_package .. 'pack/deps/start/mini.nvim'
    if not vim.loop.fs_stat(mini_path) then
      vim.cmd('echo "Installing `mini.nvim`" | redraw')
      local clone_cmd = {
        'git', 'clone', '--filter=blob:none',
        'https://github.com/echasnovski/mini.nvim', mini_path
      }
      vim.fn.system(clone_cmd)
      vim.cmd('packadd mini.nvim | helptags ALL')
      vim.cmd('echo "Installed `mini.nvim`" | redraw')
    end
    require('mini.deps').setup({ path = { package = path_package } })
    require"mini.extra".setup{}
    require"mini.icons".setup{}
    MiniIcons.mock_nvim_web_devicons()
    local now, add, later = MiniDeps.now, MiniDeps.add, MiniDeps.later
    later(MiniIcons.tweak_lsp_kind) -- Loaded with later  as it loads the whole vim.lsp module
    return now, add, later
  end
}
