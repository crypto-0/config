local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>tt", ":FloatermToggle <cr>", opts)
keymap("n", "<leader>tn", ":FloatermNew<cr>", opts)
keymap("t", "<c-\\>", "<c-\\><c-n>:FloatermToggle <cr>", opts)
keymap("t", "<c-k>", "<c-\\><c-n>:FloatermNext <cr>", opts)
keymap("t", "<c-j>", "<c-\\><c-n>:FloatermPrev <cr>", opts)
keymap("t", "<c-[>", "<c-\\><c-n>", opts)
