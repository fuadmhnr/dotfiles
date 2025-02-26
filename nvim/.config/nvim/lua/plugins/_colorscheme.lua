return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Ensure it loads early
    config = function()
      vim.cmd("colorscheme catppuccin")
    end,
  },
}
