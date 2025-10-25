return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "gd", require("telescope.builtin").lsp_definitions, "Goto definition" },
            { "gr", require("telescope.builtin").lsp_definitions, "Goto references" },
            { "gI", require("telescope.builtin").lsp_definitions, "Goto implementation" },
            {
              "<leader>vd",
              function()
                vim.cmd("vs") -- Perform vertical split
                vim.cmd("wincmd l") -- Move to the right pane
                require("telescope.builtin").lsp_definitions() -- Trigger go-to definition
              end,
            },
            {
              "<leader>vr",
              function()
                vim.cmd("vs") -- Perform vertical split
                vim.cmd("wincmd l") -- Move to the right pane
                require("telescope.builtin").lsp_references() -- Trigger go-to references
              end,
            },
          },
        },
      },
    },
  },
}
