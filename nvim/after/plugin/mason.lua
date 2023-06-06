local lspconfig = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {"pyright","lua_ls","java_language_server","tsserver","html","cssls","cmake","jsonls","emmet_ls","bashls"}
})

require("mason-lspconfig").setup_handlers({
  function(server)
    if server == "lua_ls" then
      lspconfig[server].setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            telemetry = {
              enable = false,
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.expand("$VIMRUNTIME/lua/vim")] = true,
                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
              },
            },
          },
        },
      })

    else
      lspconfig[server].setup({})
    end
  end,
})

