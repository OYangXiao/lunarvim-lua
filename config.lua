vim.opt.linespace = 3
vim.g.neovide_scale_factor = 1.2
lvim.builtin.project.manual_mode = true

lvim.builtin.which_key.mappings["-"] = {
  name = "split",
  ["-"] = { ":split<cr>","horizontal split" },
  ["|"] = { ":vsplit<cr>","vertical split" }
}

lvim.builtin.which_key.mappings["o"] = {
  name = "my menu",
  m = {":MinimapToggle<cr>", "Minimap"}
}

lvim.builtin.which_key.mappings["h"] = {
  name = "hop",
  w = {":HopWord<cr>", "word"},
  l = {":HopLine<cr>", "line"}
}

lvim.plugins = {
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
    "ggandor/leap.nvim",
    name = "leap",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    'wfxr/minimap.vim',
    build = "cargo install --locked code-minimap",
    -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
    config = function ()
      vim.cmd ("let g:minimap_width = 10")
      vim.cmd ("let g:minimap_auto_start = 1")
      vim.cmd ("let g:minimap_auto_start_win_enter = 1")
    end,
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      require("gitblame").setup { enabled = false }
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "mrjones2014/nvim-ts-rainbow",
  }
}
