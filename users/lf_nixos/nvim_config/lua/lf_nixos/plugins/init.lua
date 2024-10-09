return {
  {
    "nvim-lua/plenary.nvim",
    name = "plenary",
  },
  { 
    "rose-pine/neovim", 
    name = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine-moon")
    end
  },
  {
    "git@github.com:folke/trouble.nvim.git",
    config = function()
      require("trouble").setup {
         icons = false,
      }
    end
  },
}
