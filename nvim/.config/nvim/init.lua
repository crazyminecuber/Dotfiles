-- TODO: Learn language server for python when learning django.
-- TODO: Reload neovim when any config file is changed
-- TODO: Set up language server for webgruppen
-- TODO: Set up language server for competative programming
-- TODO: Set up language server for lua for awesome and nvim
-- TODO: sudo does not work in vim so saving as root does not work with :w!!
-- AWAITING UPSTREAM Vim does not automatilly update the contents of the file and does not sync with undotree.
-- Have a clear warning imedially and not when saving that buffer has been updated?
-- TODO: See diff between saved file and current buffer?
-- Dynamically update buffer?0
-- DONE Setup vim wich key
-- TODO: Could be a lot better at navigating around the text when inserting at
--
-- TODO: Show matching html tag somehow.
-- sertain places. Doing a lot of hjkl
-- TODO: Learn how to commit line by line in git fugative
-- TODO: Try git rebase vs git merge. Try to do selective commit, where some just
-- adds debug outputs and some fixes it and do a git cherrypick and just selct the
-- one that fixes the bug.
--
-- TODO: Make special search engines for each type of programming. Do so in order to search the documentation! Use openbrowser plugin.
-- TODO:? Tabsettings change when opening python filTabsettings change when opening python file
-- TODO: Make keybinding for jumping to tag in split
-- TODO: Use snippets for latex. Nice for \frac and \begin espically
-- TODO: Would be nice to get errors in quickfixlist from django.
-- TODO: Checkout synctex in latex
-- TODO: Change so that search only searched the buffer in fokus.
-- TODO: Latex ligatures?
-- TODO: Open file in same location as i last cloed it? Or jump to it with
-- shortcut?
-- TODO: Add <leader>fiw to insert wiki page or image in current wiki.
-- WAIT UPSTREAM Can i serach the edit history? For example if i am missing a line which i know some word in, then i can get that exact line back.
-- TODO: should learn checking utillities (formatting and compliency) for all languages
-- TODO: snippets
-- TODO: Vim wiki: kan man få en varning om man tar bort ett stycke som ett annat stycke länkar till? Så att länkar som inte leder någon vart undviks
-- TODO: checkout cheat.sh. It is better than google for programming questions and
-- TODO: Fix <leader>ra awesome binding so it makes something sensible
-- TODO: commandline searches? Reproducable?? Yes even in old neovim. Ask reddit?
-- TODO: indenline highlighting is ugly with gruvbox
-- TODO: look into projects plugin
-- DONE look into saving on exit (accidental terminal close and computer shuting off) and fixing undotree behaviour
-- TODO: Telescope grep only buffer?
-- TODO: Project plugin to set pwd
-- TODO: Get fancy function signature when typing and show what each argument is
-- try lspsaga and lsp_signature
-- TODO: Check if latex editing is nicer nowdays
-- TODO: Status message from language servers in statusbar
-- TODO: Jump to previous file how? ctrl + ´´
-- TODO: Jump to previous file how?
-- FIXME: gurkan burkan
-- HACK: its a hack
-- NOTE: a note
-- PERF: Performance mode
-- WARNING: Varnung!
-- -- Checkif breaks anything
-- when i am typing it
--
--
--
--[[ ==Points where vim and terminals sucks and no simple solutions exist==
    -- A wise man once said (i.e. me), "everything sucks and or is a convoluted
    -- mess and or has rough edges if you dig deep enough


    --No good solution to passing ctrl + non_alphanumeric_char to neovim because
    --terminals have arbitrary limitations and escape every keystroke in wierd
    --ways. Solution: use a graphical version
    --
    -- No good way of persisting undo tree when file is changed externally (ie
    -- git or other editor) Some hack form a guy on reddit that used to work but
    -- no longer does. Should be possible to create file from undo tree and than
    -- add all changes to the tree as one patch, but that is not how it works by
    -- default.
    --
    -- No good way of guaranteeing saving or backing up when terminated. Seems
    -- to work in graphical editor. Again terminal wierdness.
    --
    -- Autosave plugin makes undotree messy and not sexy. It trigger alla
    -- autocmd for bufwritepre and post. That combined with it triggering when I
    -- am typing make so that whitespaces get removed randomly. if i have on
    -- auto formatting that also messes things up.
    --
    -- So to fix most things: Auto save on exit if kill signal bla bla,, gui
    -- already does what is best....
-- swapfiles are the answer! Works great in the terminal but not so much in
-- graphical clients. Something to look into some other day. Or just use
-- terminal for now. No reason for a gui then right now. Now its just external
-- undotree that sucks.

]]

--
--
--
-- integrates nicely with vim. It know what language you are editing based on the
-- file and you can type any query you want and can have the answer displayed in a
-- buffer or immediattely paste it in. If you use a linter that finds errors, you
-- do not even have to type! You can just querry the error immediatelly
--
-- Regarding autoformatting, it is probably just an anoyance. But autowrapping
-- could be nice for booth comments in code and text in md and latex. Probably
-- nice to not autowrap lines that are already longer than textwidth. So
-- tcqln(jw?) and remove t for programming. w could be questionable for code
-- commited to repos since they could care about whitespaces not being at the end.
-- I will try without it for now.
--  Autoformatting behaviour i want.
--  * Autolinebreak on comments and text.
--  * Auto-comment if i press shift-enter
--  * Fix indenting quickly
--  * Maybe quickly toogle autoformatting?
--  * Better jump to definition and renaming. Now it did no properly identify what
--  was in derived class or in specific class. I do not know where to figure out
--  how to get this working.
--

require("user.plugins")
require("user.options")
require("user.keymaps")
require("user.colorscheme")
require("user.autocommands")





-- Try some day
--require "user.project"
-- Plug 'tpope/vim-fugitive'
