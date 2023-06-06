local ls = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
}

ls.add_snippets("lua",{
    ls.parser.parse_snippet("lf", "local $1 = function($2)\n $0\nend"),
  }
)
vim.keymap.set({"i","s"}, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end,{
silent = true
}
)
vim.keymap.set({"i","s"}, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end,{
silent = true
}
)
vim.keymap.set({"i","s"}, "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end,{
silent = true
}
)
vim.keymap.set("n", "<leader><leader>s","<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
