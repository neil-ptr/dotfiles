local servers = {
  gopls = {},
  pyright = {},
  ts_ls = {},
  jsonls = {},
  cssls = {},
  eslint = {},
  tailwindcss = {},
  astro = { filetypes = { "astro" } },
  clangd = {},
  html = { filetypes = { "html" } },
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      opts = {},
      ensure_installed = vim.tbl_keys(servers),
      {
        "mason-org/mason-lspconfig.nvim",
        opts = {
          ensure_installed = vim.tbl_keys(servers),
        },
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
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "gS", "<cmd>ClangdSwitchSourceHeader<CR>", "Goto source or header" },
            { "gd", require("telescope.builtin").lsp_definitions, "Goto definition" },
            { "gr", require("telescope.builtin").lsp_references, "Goto references" },
            { "gI", require("telescope.builtin").lsp_implementations, "Goto implementation" },
            {
              "<leader>vd",
              function()
                vim.cmd("vs") -- Perform vertical split
                require("telescope.builtin").lsp_definitions() -- Trigger go-to definition
              end,
            },
            {
              "<leader>vr",
              function()
                vim.cmd("vs") -- Perform vertical split
                require("telescope.builtin").lsp_references() -- Trigger go-to references
              end,
            },
          },
        },
      },
    },
  },
}
