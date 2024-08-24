return {
  "catppuccin/nvim", 
  name = "catppuccin", 
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      cmp = true,
      fzf = true,
      nvimtree = true,
      treesitter = true,
      gitsigns = true,

    })
    vim.cmd("colorscheme catppuccin")
  end,

}
