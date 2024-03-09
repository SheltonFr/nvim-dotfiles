return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  config = function()
    vim.keymap.set("n" , "<C-n>", ":Neotree filesystem reveal left toggle<CR>")
    require("neo-tree").setup({
      source_selector = {
        winbar = false,
        statusline = false
      },
      window = {
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
        }
      }
    })
  end
}
