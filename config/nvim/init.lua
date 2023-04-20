require'plugins'
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.winblend = 20
vim.opt.pumblend = 20
vim.opt.clipboard:append{'unnamedplus'}
vim.opt.hidden = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
-- fzf-lua init --
require'fzf-lua'.setup({
  winopts = {
    height     = 0.85,     -- window height
    width      = 0.80,     -- window width
    row        = 0.35,     -- window row position (0=top, 1=bottom)
    col        = 0.50,     -- window col position (0=left, 1=right)
    border     = 'single' -- 'none', 'single', 'double', 'thicc' or 'rounded'
  },
})

-- treesitter init --
require('nvim-treesitter.configs').setup {
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  endwise = {
    enable = true,
  },
  ensure_installed = {
    'ruby',
    'elixir',
    'lua',
    'vim',
    'go',
    'rust',
    'typescript'
  },
  indent = {
    enable = true,
  },
}

-- colorscheme init --
require('github-theme').setup({
  transparent = true,
  comment_style	= 'NONE',
  function_style = 'NONE',
  keyword_style = 'NONE',
})

vim.opt.termguicolors = true
vim.cmd 'autocmd ColorScheme * highlight Normal ctermbg=none guibg=none'
vim.cmd 'autocmd ColorScheme * highlight NonText ctermbg=none guibg=none'
vim.cmd 'autocmd ColorScheme * highlight LineNr ctermbg=none guibg=none'
vim.cmd 'autocmd ColorScheme * highlight Folded ctermbg=none guibg=none'
vim.cmd 'autocmd ColorScheme * highlight EndOfBuffer ctermbg=none guibg=none'

-- lualine init --
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1
      }
    },
    lualine_d = {'buffers'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- nvim-colorizer init --
require'colorizer'.setup()

-- indent_blankline init --
require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = true,
}

-- scrollbar init --
require("scrollbar").setup()

require("nvim-autopairs").setup()
require("fidget").setup()
-- bufferline init --
require("bufferline").setup()
vim.keymap.set('n', '<C-o>', "<cmd>bprev<CR>")
vim.keymap.set('n', '<C-p>', "<cmd>bnext<CR>")

-- fzf window color setup --
vim.cmd [[
highlight FzfLuaNormal ctermbg=none guibg=none
highlight FzfLuaBorder ctermbg=none guibg=none
]]

vim.opt.winblend = 20

-- fzf-lua setting --
vim.g.mapleader = " "
vim.keymap.set('n', '<C-f>', "<cmd>FzfLua files<CR>")
vim.keymap.set('n', '<C-g>', "<cmd>FzfLua grep<CR>")
vim.keymap.set('n', '<C-b>', "<cmd>FzfLua buffers<CR>")
vim.keymap.set('n', '<C-r>', "<cmd>Rg<CR>")
vim.keymap.set('n', '<C-n>', "<cmd>Fern . -reveal=% -drawer -width=50<CR>")
-- coc setting --
vim.keymap.set('n', '<C-[>', "<cmd>call CocActionAsync('jumpDefinition')<CR>")
vim.keymap.set('n', '<C-]>', "<cmd>call CocActionAsync('jumpReferences')<CR>")
vim.keymap.set(
    'i',
    '<CR>',
    function()
        if vim.fn['coc#pum#visible']() == 1 then
            return vim.fn['coc#pum#confirm']()
        else
            return "<CR>"
        end
    end,
    { expr = true }
)
