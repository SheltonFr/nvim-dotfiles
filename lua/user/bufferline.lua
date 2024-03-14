local M = {
  "akinsho/nvim-bufferline.lua",
}

function M.config()
  require("bufferline").setup({
    options = {
      numbers = "ordinal",
      always_show_bufferline = true,
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      left_mouse_command = "buffer %d",
      middle_mouse_command = nil,
      offsets = {{
        filetype = "NvimTree",
        text = function()
          local function mysplit(inputstr, sep)
            if sep == nil then
              sep = "%s"
            end
            local t = {}
            for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
              table.insert(t, str)
            end
            return t
          end

          local mytable = mysplit(vim.fn.getcwd(), "/")

          local function tablelength(T)
            local count = 0
            for _ in pairs(T) do count = count + 1 end
            return count
          end

          return string.upper(mytable[tablelength(mytable)])
        end,
        highlight = require("catppuccin.groups.integrations.bufferline").get(),
        separator = true,
        text_align = "left"

      }},
      show_tab_indicators = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        return "("..count..")"
      end,
      custom_filter = function(buf_number)
        if vim.bo[buf_number].filetype ~= "NvimTree" then
          return true
        end
      end,
      custom_areas = {
        right = function()
          local result = {}
          local error = vim.lsp.diagnostic.get_count(0, "Error")
          local warning = vim.lsp.diagnostic.get_count(0, "Warning")
          local info = vim.lsp.diagnostic.get_count(0, "Information")
          local hint = vim.lsp.diagnostic.get_count(0, "Hint")

          if error ~= 0 then
            table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
          end

          if warning ~= 0 then
            table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
          end

          if hint ~= 0 then
            table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
          end

          if info ~= 0 then
            table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
          end
          return result
        end,
      },
    },
  })

  local wk = require "which-key"
  wk.register {
    ["<leader>b"] = {
      name = "Bufferline",
      b = { "<cmd>BufferLinePick<cr>", "Pick Buffer" },
      c = { "<cmd>BufferLineCloseLeft<cr>", "Close Buffer" },
      d = { "<cmd>BufferLineSortByDirectory<cr>", "Sort By Directory" },
      e = { "<cmd>BufferLineSortByExtension<cr>", "Sort By Extension" },
      h = { "<cmd>BufferLineCloseRight<cr>", "Close Buffer" },
      l = { "<cmd>BufferLineCloseLeft<cr>", "Close Buffer" },
      n = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer" },
      p = { "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer" },
      r = { "<cmd>BufferLineSortByRelativeDirectory<cr>", "Sort By Relative Directory" },
      s = { "<cmd>BufferLinePickClose<cr>", "Pick and Close Buffer" },
      w = { "<cmd>BufferLineCloseRight<cr>", "Close Buffer" },
    },
  }
end

return M
