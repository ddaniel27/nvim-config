local fn = vim.fn
local data_path = fn.stdpath('data')
local compile_path = data_path..'/site/plugin/packer_compiled.lua'
local install_path = data_path..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_JUST_INSTALLED = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
    vim.cmd('packadd packer.nvim')
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

return packer.startup({
  function(use)
    use { 'wbthomason/packer.nvim' }

    use { 'nyoom-engineering/oxocarbon.nvim' }

    use { 'github/copilot.vim' }

    use { 'tpope/vim-fugitive' }

    use { 'mhinz/vim-signify' }

    use { 
      'xiyaowong/transparent.nvim',
      run = ':TransparentEnable',
  }

    use {
      'nvim-tree/nvim-tree.lua',
      config = function() require("setup.nvim-tree") end,
      requires = {
        'nvim-tree/nvim-web-devicons',
      },
    }

    use {
      'nvim-treesitter/nvim-treesitter',
      config = function() require('setup.treesitter') end,
      run = ':TSUpdate',
    }

    use {
      'junegunn/fzf.vim',
      config = function() require('setup.fzf') end,
      requires = {
        {
          'junegunn/fzf',
          run = function() vim.fn['fzf#install']() end,
        },
      },
    }

    use {
      'nvim-lualine/lualine.nvim',
      config = function() require('setup.lualine') end,
    }

    use {
      'nanozuki/tabby.nvim',
      config = function() require('setup.tabby') end,
    }

    use {
      'ray-x/navigator.lua',
      config = function() require('setup.navigator') end,
      requires = {
        { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
        { 'neovim/nvim-lspconfig' },
        { 'ray-x/go.nvim' },
        { 'neovim/nvim-lspconfig' },
      },
    }

    use {
      'hrsh7th/nvim-cmp',
      config = function() require('setup.cmp') end,
      requires = {
        'hrsh7th/cmp-cmdline',
        'windwp/nvim-autopairs',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
        'hrsh7th/vim-vsnip-integ',
      },
    }

    if PACKER_JUST_INSTALLED then
      vim.api.nvim_create_autocmd('User PackerComplete', {
        command = 'qa!',
      })
      packer.sync()
    end
  end,
  config = {
    compile_path = compile_path,
  },
})

--     use { 'nyoom-engineering/oxocarbon.nvim' }
--     use 'EdenEast/nightfox.nvim'
--     use 'ribru17/bamboo.nvim'
-- use {
--     "alexghergh/nvim-tmux-navigation",
--     config = function() require("setup.nvim-tmux-navigation") end,
--   }
