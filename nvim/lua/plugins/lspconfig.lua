return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "gS", "<cmd>ClangdSwitchSourceHeader<CR>", "Goto source or header" },
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
  {
    "mason.nvim",
    {
      "mason-org/mason-lspconfig.nvim",
      config = function()
        local lspconfig = require("lspconfig")

        -- #NOTE only for the tcp/ip stack project
        lspconfig.clangd.setup({
          cmd = { "docker", "exec", "-i", "tcpdev", "clangd", "--background-index" },
          root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git", "."),
          -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
          -- on_attach = on_attach,
          -- settings = servers[server_name],
          -- filetypes = (servers[server_name] or {}).filetypes,
        })
      end,
    },
  },
}
