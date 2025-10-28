return {
  { "folke/trouble.nvim", enabled = false },
  { "folke/flash.nvim", enabled = false },
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
    },
    keys = {
      { "<leader>fe", false },
      { "<leader>fE", false },
      { "<leader>e", false },
      { "<leader>E", false },
    },
  },

  { "akinsho/bufferline.nvim", enabled = false },
}
