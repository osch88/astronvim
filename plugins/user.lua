return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    opts = {},
    event = "User AstroFile",
    cmd = { "TodoQuickFix" },
    keys = {
      { "<leader>T", "<cmd>TodoTelescope<cr>", desc = "Open TODOs in Telescope" },
    },
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      { "<leader>Z", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode"},
      opts = {
        window = {
          backdrop = 1,
          width = function() return math.min(120, vim.o.columns * 0.75) end,
          height = 0.9,
          options = {
            number = false,
            relativenumber = false,
            foldcolumn = "0",
            list = false,
            showbreak = "NONE",
            signcolumn = "no",
          },
        },
        plugins = {
          options = {
            cmdheight = 1,
            laststatus = 0,
          },
          gitsigns = { enabled = false }, -- disables git signs
          tmux = { enabled = false },
          alacritty = {
            enabled = false,
            font = "14", -- font size
          },
        },
        on_open = function() -- disable diagnostics and indent blankline
          vim.g.diagnostics_mode_old = vim.g.diagnostics_mode
          vim.g.diagnostics_mode = 0
          vim.diagnostic.config(require("astronvim.utils.lsp").diagnostics[0])
          vim.g.indent_blankline_enabled_old = vim.g.indent_blankline_enabled
          vim.g.indent_blankline_enabled = false
        end,
        on_close = function() -- restore diagnostics and indent blankline
          vim.g.diagnostics_mode = vim.g.diagnostics_mode_old
          vim.diagnostic.config(require("astronvim.utils.lsp").diagnostics[vim.g.diagnostics_mode])
          vim.g.indent_blankline_enabled = vim.g.indent_blankline_enabled_old
        end,
      },
    },
  }
}
