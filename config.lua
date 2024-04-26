-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--

-- fot reple the codes
lvim.plugins = {
  { 'jalvesaq/Nvim-R'},
  { 'ncm2/ncm2'},
  { 'roxma/nvim-yarp'},
  { 'gaalcaras/ncm-R'},
  { 'preservim/nerdtree'},
  { 'Raimondi/delimitMate'},
  { 'patstockwell/vim-monokai-tasty'},
  { 'itchyny/lightline.vim'},
  {
   "jpalardy/vim-slime",
   config = function()
     -- vim.cmd([[
     -- let g:slime_default_config = { "sessionname": "NVIM", "windowname": "0"}
     -- let g:slime_dont_ask_default = 1
     -- let g:slime_cell_delimiter = "#%%"
     -- nmap <leader>a <Plug>SlimeSendCell
     -- ]])
   end
  }
}

lvim.builtin.which_key.mappings["r"] = {
    name = " Run",
    p = {
      "<cmd>TermExec open=1<CR><cmd>ToggleTermSendCurrentLine<CR>", --<cmd>ToggleTerm<CR>",
      "Python REPL",
    },
    -- add repl for other langs
}
-- vim.cmd [[let g:slime_target = "toggleterm.nvim"]]
vim.cmd [[let g:slime_target = "tmux"]]
-- " NERD Tree
vim.cmd [[map tt :NERDTreeToggle]]
-- NCM2
vim.cmd [[autocmd BufEnter * call ncm2#enable_for_buffer() ]] -- To enable ncm2 for all buffers.
vim.cmd [[set completeopt=noinsert,menuone,noselect ]] -- help Ncm2PopupOpen for more information.

-- Spell check
vim.cmd [[ set spell spelllang=en_us ]]
-- other configuration
-- text wrap
vim.wo.wrap = true
-- code fold
vim.opt.foldmethod = "expr" -- default is "normal"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- default is ""
vim.opt.foldenable = true -- if this option is true and fold method option is other than normal, every time a document is opened everything will be folded.
