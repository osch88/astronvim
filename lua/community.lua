return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.motion.marks-nvim" },
  { import = "astrocommunity.pack.markdown" },
  -- { import = "astrocommunity.note-taking.neorg" },
  {
    "nvim-neorg/neorg",
    ft = "norg",
    version = "7.*",
    dependencies = { "nvim-lua/plenary.nvim" },
    build = ":Neorg sync-parsers",
    lazy = false,
    event = "User AstroFile",
    cmd = "Neorg",
    keys = {
      { "<leader>Ni", "<cmd>Neorg index<cr>", desc = "Open Neorg index"},
      { "<leader>Nt", "<cmd>Neorg toc<cr>", desc = "Open Neorg toc"},
    },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {
            config = { icon_present = "diamond" }
          }, -- Adds pretty icons to your documents
          ["core.export"] = {},
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes",
            },
          },
          ["core.esupports.metagen"] = { config = { type = "auto", update_date = true } },
          ["core.qol.toc"] = {},
          ["core.qol.todo_items"] = {},
          ["core.looking-glass"] = {},
          ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
        },
      }
    end,
  },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.python" },
  -- { import = "astrocommunity.pack.yaml" },
  -- { import = "astrocommunity.pack.html-css" },
}
