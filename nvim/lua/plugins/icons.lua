return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.icons = {
        rules = {
          { plugin = "avante.nvim", icon = LazyVim.config.icons.kinds.Supermaven, color = "purple" },
        },
      }
    end,
  },
}
