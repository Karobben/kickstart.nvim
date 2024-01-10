-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--

-- fot reple the codes
lvim.plugins = {
  { "jpalardy/vim-slime" },
}

vim.cmd [[let g:slime_target = "tmux"]]

-- other configuration
-- text wrap
vim.wo.wrap = true

-- code fold

vim.opt.foldmethod = "expr" -- default is "normal"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- default is ""
vim.opt.foldenable = true -- if this option is true and fold method option is other than normal, every time a document is opened everything will be folded.
