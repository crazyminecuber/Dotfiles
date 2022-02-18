-- "------------------------------ Vim wiki --------------------------------
-- "let g:vimwiki_list = [{'path': '~/vimwiki/',
--                     "\ 'syntax': 'markdown', 'ext': '.wiki'}]
-- "let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown':'markdown'}
-- let g:vimwiki_ext2syntax = {}
-- let g:vimwiki_list = [{
-- \ 'path': '$HOME/vimwiki',
-- \ 'template_path': '$HOME/vimwiki/template',
-- \ 'template_default': 'default',
-- \ 'auto_export': 1,
-- \ 'template_ext': '.html'}]

--vim.g.vimwiki_ext2syntax = {{}}
vim.g.vimwiki_list = {
{
	path = "$HOME/vimwiki",
	template_path = "$HOME/vimwiki/template",
	template_default = "default",
	auto_export = 1,
	template_ext = ".html",
  }
}


-- use {
--     'vimwiki/vimwiki',
--     config = function()
--         vim.g.vimwiki_list = {
--             {
--                 path = '/home/xx/Documents/singularityOffice/wiki',
--                 syntax = 'markdown',
--                 ext = '.md',
--             }
--         }
--     end
-- }
