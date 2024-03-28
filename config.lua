vim.opt.linespace = 3
vim.g.neovide_scale_factor = 1.2
lvim.builtin.project.manual_mode = true

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
    config = function()
      vim.cmd("let g:minimap_width = 10")
      vim.cmd("let g:minimap_auto_start = 1")
      vim.cmd("let g:minimap_auto_start_win_enter = 1")
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
  },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
        require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
      end, 100)
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    version = "1.*",
    config = function()
      require("window-picker").setup({
        autoselect_one = true,
        include_current = false,
        filter_rules = {
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },

            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal" },
          },
        },
        other_win_hl_color = "#e35e4f",
      })
    end,
  }
}




lvim.builtin.which_key.mappings["w"] = {
  name = "Window",
  ["s"] = { ":split<cr>", "horizontal split" },
  ["v"] = { ":vsplit<cr>", "vertical split" },
  j = {
    function()
      local picker = require('window-picker')
      local picked_window_id = picker.pick_window({
        include_current_win = true
      }) or vim.api.nvim_get_current_win()
      vim.api.nvim_set_current_win(picked_window_id)
    end,
    "Pick a window"
  }
}

lvim.builtin.which_key.mappings["b"]["w"] = {
  ":w<cr>",
  "save"
}

lvim.builtin.which_key.mappings["o"] = {
  name = "my menu",
  m = { ":MinimapToggle<cr>", "Minimap" }
}

lvim.builtin.which_key.mappings["h"] = {
  name = "hop",
  w = { ":HopWord<cr>", "word" },
  l = { ":HopLine<cr>", "line" }
}

lvim.builtin.which_key.mappings["e"] = {
  name = "Explorer",
  e = { ":NvimTreeToggle<cr>", "Toggle" },
  f = { ":NvimTreeFocus<cr>", "Focus" },
  r = { ":NvimTreeRefresh<cr>", "Refresh" },
  s = { ":NvimTreeFindFile<cr>", "Find" },
}
