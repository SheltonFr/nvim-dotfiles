return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' },
  config = function()
    local wk = require "which-key"
    wk.register {
      ["<leader>bb"] = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },

      ["<leader>fb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      ["<leader>fc"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find files" },
      ["<leader>fp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
      ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
      ["<leader>fs"] = { "<cmd>Telescope grep_string<cr>", "Find String" },
      ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help" },
      ["<leader>fH"] = { "<cmd>Telescope highlights<cr>", "Highlights" },
      ["<leader>fi"] = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
      ["<leader>fl"] = { "<cmd>Telescope resume<cr>", "Last Search" },
      ["<leader>fM"] = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
      ["<leader>fR"] = { "<cmd>Telescope registers<cr>", "Registers" },
      ["<leader>fk"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      ["<leader>fC"] = { "<cmd>Telescope commands<cr>", "Commands" },

      ["<leader>go"] = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      ["<leader>gb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      ["<leader>gc"] = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      ["<leader>gC"] = {
        "<cmd>Telescope git_bcommits<cr>",
        "Checkout commit(for current file)",
      },

      ["<leader>ls"] = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      ["<leader>lS"] = {
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        "Workspace Symbols",
      },
      ["<leader>le"] = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
    }

    require("telescope").setup {
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
          }
        }
      }
    }
    require("telescope").load_extension("ui-select")
  end
}
