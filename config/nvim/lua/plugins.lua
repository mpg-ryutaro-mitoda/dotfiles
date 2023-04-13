require'packer'.startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { 'windwp/nvim-autopairs' }
  use 'j-hui/fidget.nvim'
  use 'tpope/vim-fugitive'
  use 'obaland/vfiler.vim'
  use 'obaland/vfiler-fzf'
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
         current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
         current_line_blame_opts = {
           virt_text = true,
           virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
           delay = 1000,
           ignore_whitespace = false,
       },
         current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      })
    end
  }
  use 'ibhagwan/fzf-lua'
  use 'lambdalisue/fern.vim'
  use 'lambdalisue/fern-git-status.vim'
  use 'norcalli/nvim-colorizer.lua'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use { 'petertriho/nvim-scrollbar' }
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use { 'projekt0n/github-nvim-theme', tag = 'v0.0.7' }
  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }
  use {'neoclide/coc.nvim', branch = 'release'}
  use { 'github/copilot.vim' }
end)
