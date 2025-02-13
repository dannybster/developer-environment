-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Associated ejs and hbs files with html.
vim.filetype.add({ extension = { ejs = "html", hbs = "html" } })

-- Vim markdown highlighting apparently doesn't work great
-- see https://github.com/epwalsh/obsidian.nvim?tab=readme-ov-file#syntax-highlighting
vim.g.vim_markdown_frontmatter = 1
