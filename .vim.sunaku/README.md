# A modular (Neo)Vim configuration

Unlike most Vim configurations you find online, this one is _modular_: it's
*not* a monolithic `vimrc` file!  May it help you journey the lands of Vim.

Don't forget to check out the handy [list of shortcuts](#shortcuts) below!

## Features

* Modularity of bundles, filetypes, colorschemes, and Vim settings.

* Lazy loading of filetype-specific bundles to start Vim up quickly.

* Parallel installation and updating of bundles from Git repositories.

* Easy upgrades with intelligent and automated Git conflict resolution.

* Shell scripts for bundle management: insert, delete, rename, and more.

## Organization

### Branches

* The **[master]** branch is a bare bones template for anyone to start with.
[master]: https://github.com/sunaku/.vim/tree/master#readme

* The **[earthy]** branch adds my personal configuration of the standard Vim.
[earthy]: https://github.com/sunaku/.vim/tree/earthy#readme

* The **[spacey]** branch adds [an enhanced Space leader][vim-shortcut] key,
  just like [Spacemacs], along with my chosen bundles and their configuration.
[spacey]: https://github.com/sunaku/.vim/tree/spacey#readme
[vim-shortcut]: https://github.com/sunaku/vim-shortcut#readme
[Spacemacs]: http://spacemacs.org/

    ![Screencast](https://github.com/sunaku/vim-shortcut/raw/gh-pages/README.gif)

### Scripts

* The `.do/` directory contains shell scripts that automate various tasks.

### Bundles

* `**/*.get` files specify URLs of Git repositories to clone for your bundles.

* `**/*.run` files specify shell commands to run after updating your bundles.

* `bundle/*/*/` directories are eagerly loaded Vim scripts; see [Unbundle].

* `ftbundle/*/*/` directories are lazily loaded, filetype-specific bundles.

### Configs

* `plugin/**/*.vim` configure Vim _before_ it finishes starting up.

* `bundle/*/*.vim` configure your bundles _before_ they are loaded.

* `ftbundle/*/*.vim` configure your ftbundles _before_ they are loaded.

* `ftplugin/{*,/*}.vim` configure your filetypes _when_ they are loaded.

* `recolor/*.vim` configure your colorschemes _after_ they are applied.

* `after/plugin/**/*.vim` configure Vim _after_ it finishes starting up.

## Dependencies

* [Vim](http://www.vim.org/) 7+ or [NeoVim](https://neovim.io/) 0.1+

* [Git](http://git-scm.com/) 1.5+

* [POSIX] environment (Linux, BSD, MacOSX, etc.)
  [POSIX]: http://pubs.opengroup.org/onlinepubs/9699919799/

    Special note to Microsoft Windows users: simply

    * replace `~/.vim` with `%USERPROFILE%\vimfiles`
    * replace `~/.vimrc` with `%USERPROFILE%\_vimrc`

    in all commands listed throughout this document.

* [xargs](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/xargs.1)
  with support for the `-r` command-line option:

    > Do not run the command if there are no arguments.  Normally the
    > command is executed at least once even if there are no arguments.

[Unbundle]: https://github.com/sunaku/vim-unbundle#readme

## Installation

Backup your configuration:

    mv ~/.vim ~/.vim.bak
    mv ~/.config/nvim ~/.config/nvim.bak # for NeoVim

Install this configuration:

    git clone https://github.com/sunaku/.vim.git ~/.vim
    ln -s ~/.vim ~/.config/nvim  # for NeoVim
    cd ~/.vim
    .do/setup

Select a Git branch to use:

    .do/setup           # bare bones
    .do/setup earthy    # bare bones + my config
    .do/setup spacey    # bare bones + my config + my bundles

## Usage

See usage information:

    .do/help

See usage information for provided *SCRIPT*:

    .do/help SCRIPT

### Bundling

Add bundle from *URL* under *CATEGORY*:

    .do/insert URL bundle/CATEGORY

Add bundle from *URL* under *CATEGORY* with *BUNDLE_NAME*:

    .do/insert URL bundle/CATEGORY/BUNDLE_NAME

Add ftbundle from *URL* for *FILETYPE*:

    .do/insert URL ftbundle/FILETYPE

Add ftbundle from *URL* for *FILETYPE* with *BUNDLE_NAME*:

    .do/insert URL ftbundle/FILETYPE/BUNDLE_NAME

Add bundle from Github *USER*/*REPO* under *CATEGORY*:

    .do/insert USER/REPO bundle/CATEGORY

Add bundle from Github *USER*/*REPO* under *CATEGORY* with *BUNDLE_NAME*:

    .do/insert USER/REPO bundle/CATEGORY/BUNDLE_NAME

Add ftbundle from Github *USER*/*REPO* for *FILETYPE*:

    .do/insert USER/REPO ftbundle/FILETYPE

Add ftbundle from Github *USER*/*REPO* for *FILETYPE* with *BUNDLE_NAME*:

    .do/insert USER/REPO ftbundle/FILETYPE/BUNDLE_NAME

Move or rename bundles with names matching *BUNDLE_NAME* (regexp):

    .do/rename BUNDLE_NAME

Delete bundles with names matching *BUNDLE_NAME* (regexp):

    .do/delete BUNDLE_NAME

Lists untracked `*.get` files and bundles lacking `*.get` files:

    .do/orphans

Deletes untracked `*.get` files and bundles lacking `*.get` files:

    .do/clean        # asks you for confirmation
    .do/clean -f     # no confirmation; force it

### Updating

Update installed bundles and ftbundles:

    .do/update

Update this Vim configuration framework:

    .do/rebase      # asks to confirm .do/clean
    .do/rebase -f   # no confirmation; force it

Do all that periodically via crontab(1):

    @daily cd ~/.vim && .do/rebase -f && .do/update

#### Locking

Lock a *BUNDLE* to a certain Git *COMMIT* to prevent it from being updated:

    cd BUNDLE
    git checkout COMMIT

Unlock a locked *BUNDLE* so that it can be updated again:

    cd BUNDLE
    git checkout master

## Shortcuts

This branch of the Vim configuration defines the following shortcuts.

Tips:
* `<C-c>` is like `<Esc>` but it doesn't break macros containing the Alt key.
* Run `stty -ixon` before launching Vim to use `<C-s>` and `<C-q>` shortcuts.

### Leader

* `,` is the `<Leader>`: a prefix for shortcuts in this configuration.
* Press it and wait for 2 seconds for listing of all leader shortcuts.

### Command

* `;` puts Vim into command mode. It is a shift-less alternative to `:`.
* `!` puts Vim into command mode, ready to run an external shell command.

### Undo

* `U` re-does the last undone change.  It is the same as `<C-r>` in Vim.

### Quit

* `<C-q>` quits Vim.
* `<Leader><C-q>` closes all buffers and all windows _without_ quitting Vim.

### Window

* `<Leader>1` maximizes current window by collapsing others.
* `<Leader>!` closes all windows except current window.
* `<Leader>2` creates new window below current window.
* `<Leader>3` creates new window to the right of current window.
* `<Leader>4` closes current window.
* `<Leader>0` divides screen equally amongst all windows.

Focus:
* `<A-PageUp>` focuses next window.
* `<A-PageDown>` focuses previous window.

Scroll:
* `<C-Left>` scrolls window left.
* `<C-Right>` scrolls window right.
* `<C-S-Left>` scrolls window all the way left.
* `<C-S-Right>` scrolls window all the way right.

### Tab

* `<Leader><PageUp>` selects previous tab.
* `<Leader><PageDown>` selects next tab.

### Buffer

* `<C-s>` strips trailing whitespace from current buffer and writes to disk.
* `<Leader><C-s>` strips trailing whitespace from current buffer.
* `<Leader>$` closes current buffer while retaining current window.
* `<Leader>7` discards unsaved changes and reloads current buffer from disk.
* `<C-PageUp>` displays previous buffer in current window.
* `<C-PageDown>` displays next buffer in current window.

### Fold

Jump:
* `<C-Up>` jumps to nearest fold above current line.
* `<C-Down>` jumps to nearest fold below current line.
* `<C-S-Up>` jumps to nearest section above current line.
* `<C-S-Down>` jumps to nearest section below current line.

Fold:
* `<A-Down>` opens current fold.
* `<A-S-Down>` opens current fold and any folds contained therein.
* `<A-Up>` closes current fold.
* `<A-S-Up>` closes current fold and any folds contained therein.

Level:
* `<A-Left>` closes folds at current level.
* `<A-S-Left>` closes all folds.
* `<A-Right>` opens folds at next level.
* `<A-S-Right>` opens all folds.
* `<Leader>z` closes all folds except those containing cursor.

### Search

* `<C-l>` clears search result highlighting.
* `<Leader>c/` finds merge conflict markers.
* `-` repeats the current `f`,`F`,`t`,`T` forward like the original `;` does.
* `_` repeats the current `f`,`F`,`t`,`T` backward like the original `,` does.

### Select

* `gV` selects last edited or pasted region.
* `g/` selects next nearest search result.
* `g?` selects previous nearest search result.

### Yank

* `Y` yanks from cursor to end of line, like Vim's `C` and `D` shortcuts.
* `<Leader>y` copies the current visual selection to the system clipboard.

### Format

Indent:
* `<Leader>=<Tab>` disables "2 spaces equals 1 tab" indentation style.
* `<Leader>=<Space>` enables "2 spaces equals 1 tab" indentation style.

Decorate:
* `<Leader>=-` inserts or updates section separator at end of current line.
* `<Leader>=_` repeats last character to the maximum width of current line.

Markdown:
* `<Leader>=1` formats current line as a top-level heading in Markdown.
* `<Leader>=2` formats current line as a second-level heading in Markdown.
* `<Leader>=`\` converts Markdown indented code block into fenced code block.
* `<Leader>=|` converts Markdown table heading into a heading/body separator.

### Toggle

Options:
* `coN` toggles relative line numbering.
* `cof` toggles automatic formatting.
* `cop` toggles paste mode.
* `cos` toggles spell check.
* `coz` toggles code folding.

### Diff

* `<Leader>db` diffs current buffer.
* `<Leader>df` diffs current buffer against original file.
* `<Leader>dl` puts change into left-hand buffer in 3-way diff.
* `<Leader>dr` puts change into right-hand buffer in 3-way diff.
* `<Leader>dL` obtains change from left-hand buffer in 3-way diff.
* `<Leader>dR` obtains change from right-hand buffer in 3-way diff.
* `<Leader>du` updates differences; run this after you make changes.
* `<Leader>dq` quits diff mode.

## URxvt integration

If you use Vim in the URxvt terminal emulator, then load the following
snippet into xrdb(1) so you can use all the shortcuts defined in this
Vim configuration:

    xrdb -merge ~/.vim/urxvt.xrdb

## References

* http://learnvimscriptthehardway.stevelosh.com/chapters/42.html
* http://vim.wikia.com/wiki/Example_vimrc
* http://items.sjbach.com/319/configuring-vim-right
* http://push.cx/2008/256-color-xterms-in-ubuntu
* http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen
* http://vim.wikia.com/wiki/Single_tags_file_for_a_source_tree
* http://vimcasts.org/episodes/bubbling-text/
* https://sunaku.github.io/switching-from-jedit-to-vim.html
* https://sunaku.github.io/vim-script-management-system.html
