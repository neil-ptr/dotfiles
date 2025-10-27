local blend = 50

vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopePrompt",
  callback = function(ctx)
    local backdropName = "TelescopeBackdrop"
    local telescopeBufnr = ctx.buf

    -- `Telescope` does not set a zindex, so it uses the default value
    -- of `nvim_open_win`, which is 50: https://neovim.io/doc/user/api.html#nvim_open_win()
    local telescopeZindex = 50

    local backdropBufnr = vim.api.nvim_create_buf(false, true)
    local winnr = vim.api.nvim_open_win(backdropBufnr, false, {
      relative = "editor",
      border = "none",
      row = 0,
      col = 0,
      width = vim.o.columns,
      height = vim.o.lines,
      focusable = false,
      style = "minimal",
      zindex = telescopeZindex - 1, -- ensure it's below the reference window
    })

    vim.api.nvim_set_hl(0, backdropName, { bg = "#000000", default = true })
    vim.wo[winnr].winhighlight = "Normal:" .. backdropName
    vim.wo[winnr].winblend = blend
    vim.bo[backdropBufnr].buftype = "nofile"

    -- close backdrop when the reference buffer is closed
    vim.api.nvim_create_autocmd({ "WinClosed", "BufLeave" }, {
      once = true,
      buffer = telescopeBufnr,
      callback = function()
        if vim.api.nvim_win_is_valid(winnr) then
          vim.api.nvim_win_close(winnr, true)
        end
        if vim.api.nvim_buf_is_valid(backdropBufnr) then
          vim.api.nvim_buf_delete(backdropBufnr, { force = true })
        end
      end,
    })
  end,
})

local actions = require("telescope.actions")
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      layout_config = {
        horizontal = {
          prompt_position = "top",
        },
      },
      sorting_strategy = "ascending",
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer,
        },
      },
    },
  },

  keys = {
    -- disable default grep mapping if you don't use it
    { "<leader>/", false },

    -- find files in project root
    {
      "<leader>sp",
      function()
        require("telescope.builtin").find_files({
          cwd = LazyVim.root(),
        })
      end,
      desc = "Find Files (Root Dir)",
    },

    -- find files in current working directory
    {
      "<leader>sP",
      function()
        require("telescope.builtin").find_files({
          cwd = vim.uv.cwd(),
        })
      end,
      desc = "Find Files (cwd)",
    },

    -- live grep
    {
      "<leader>sf",
      function()
        require("telescope.builtin").live_grep({
          cwd = LazyVim.root(),
        })
      end,
      desc = "Grep (Root Dir)",
    },

    -- search wordk
    {
      "<leader>sw",
      function()
        require("telescope.builtin").grep_string({
          cwd = LazyVim.root(),
        })
      end,
      desc = "Grep (Root Dir)",
    },

    -- buffers
    {
      "<leader><space>",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Buffers",
    },

    -- recent files
    {
      "<leader>sr",
      function()
        require("telescope.builtin").oldfiles()
      end,
      desc = "Recent Files",
    },
  },
}
