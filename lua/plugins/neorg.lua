return  {
  "nvim-neorg/neorg",
  ft = "norg",
  version = "*",
  -- dependencies = { "nvim-lua/plenary.nvim" },
  -- build = ":Neorg sync-parsers",
  lazy = false,
  event = "User AstroFile",
  cmd = "Neorg",
  keys = {
    -- { "<leader>Ni", "<cmd>Neorg index<cr>", desc = "Open Neorg index" },
    -- { "<leader>Nt", "<cmd>Neorg toc<cr>", desc = "Open Neorg toc" },
    { "<leader>N", "<cmd>Neorg<cr>", desc = "Open Neorg toc" },
  },
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {
          config = { icon_present = "diamond" },
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
    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
