-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Associated ejs files with html.
vim.filetype.add({ extension = { ejs = "html", hbs = "html" } })
-- vim.cmd("colorscheme cyberdream")
