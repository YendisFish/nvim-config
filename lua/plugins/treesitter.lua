require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "lua",  "c_sharp", "javascript", "html", "css" },
  sync_install = true,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  }
})
