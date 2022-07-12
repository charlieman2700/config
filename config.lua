-- general
-- THEME
lvim.colorscheme = "tokyonight"
vim.g.tokyonight_style = "storm"

--  FORMAT_ON_SAVE
lvim.format_on_save = true

lvim.log.level = "warn"
lvim.lsp.automatic_servers_installation = true
lvim.leader = "space"
vim.opt.relativenumber = true
lvim.builtin.treesitter.rainbow.enable = true
vim.o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "dartls" })
-- KEYMAPPINGS
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["f"] = "/"
lvim.keys.normal_mode["gk"] = "<cmd> Lspsaga hover_doc<CR>"
lvim.keys.normal_mode["gs"] = "<cmd> Lspsaga signature_help<CR>"
lvim.keys.normal_mode["gd"] = "<cmd> Lspsaga preview_definition<CR>"

lvim.builtin.which_key.mappings["a"] = {
  name = "linter",
  f = { '<cmd>EslintFixAll<CR>', 'Fix With Eslint' },
  e = { '<cmd>ALEFix eslint<CR>', 'Fix With Eslint' },
  R = { '<cmd>ALEFindReferences<CR>', 'Find References' },
}

lvim.builtin.which_key.mappings["r"] = {
  name = "Resize",
  l = { "<cmd>vertical resize +20<CR>", "Panel Bigger Vertical" },
  h = { "<cmd>vertical resize -20<CR>", "Panel Smaller Vertical" },
  k = { "<cmd>resize -20<CR>", "Panel Smaller Vertical" },
  j = { "<cmd>resize +20<CR>", "Panel Smaller Vertical" }
}

lvim.builtin.which_key.mappings["F"] = {
  name = "Flutter",
  c = { ":FlutterCopyProfilerUrl<CR>", "Copy Profile Url" },
  d = { ":FlutterDevices<CR>", "Devices" },
  D = { ":FlutterDevTools<CR>", "Dev Tools" },
  e = { ":FlutterEmulators<CR>", "Emulators" },
  h = { ":FlutterReload<CR>", "Reload" },
  H = { ":FlutterRestart<CR>", "Restart" },
  l = { ":FlutterLogClear<CR>", "Log Clear" },
  o = { ":Flutterlvimutline<CR>", "lvimutline" },
  p = { ":FlutterPubGet<CR>", "Pub Get" },
  q = { ":FlutterQuit<CR>", "Quit" },
  r = { ":FlutterRun<CR>", "Run" },
  v = { ":FlutterVisualDebug<CR>", "Visual Debug" },
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "eslint" },
}
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint" },
}
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Additional Plugins
lvim.plugins = {
  { 'dense-analysis/ale' },
  { 'sainnhe/edge' },
  { "folke/tokyonight.nvim" },
  { "Galooshi/import-js" },
  { 'mhartington/oceanic-next' },
  { 'andersevenrud/nordic.nvim' },
  { 'shaunsingh/solarized.nvim' },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "p00f/nvim-ts-rainbow",
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
      })
    end
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard", "alpha" }
      vim.g.indent_blankline_buftype_exclude = { "terminal", "alpha" }
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = true
      vim.opt.list = true
      -- vim.opt.listchars:append("space:⋅")
    end
  },
  {
    "tpope/vim-surround",
    keys = { "c", "d", "y" }
    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  },
  {
    "wakatime/vim-wakatime"
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120; -- Width of the floating window
        height = 25; -- Height of the floating window
        default_mappings = false; -- Bind default mappings
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      }
    end
  },
  {
    'akinsho/flutter-tools.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("flutter-tools").setup {
        decorations = {
          statusline = {
            app_version = false,
            device = true,
          }
        },
        widget_guides = {
          enabled = true,
        },
        outline = {
          open_cmd = "30vnew", -- command to use to open the outline buffer
          auto_open = false -- if true this will open the outline automatically when it is first populated
        }
      }
    end
  },

  {
    "folke/todo-comments.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end
  },
  {
    'sheerun/vim-polyglot'
  },
  {
    'morhetz/gruvbox'
  },
  { 'ryanoasis/vim-devicons' }

}
