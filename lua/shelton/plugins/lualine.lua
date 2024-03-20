return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()

    require("lualine").setup {
      options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = '', right = '' },
        ignore_focus = { "NvimTree", "alpha", "toggleterm", "packer" },
      },
      sections = {
        lualine_a = { { "mode", icons_enabled = true, icon = "" } },
        lualine_b = { { "branch", icon = "" }, "diffs" },
        lualine_z = { { "progress", icons_enabled = true, icon = "" } }
      },
      -- extensions = { "quickfix", "man", "fugitive", "oil" },
      extensions = { "quickfix", "man", "fugitive" },
    }
  end
}
