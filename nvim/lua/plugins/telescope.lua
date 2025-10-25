local actions = require("telescope.actions")
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
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
