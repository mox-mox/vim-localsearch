Localsearch - Window local searching in Vim
===========================================

What will it do?
----------------
Turn on Localsearch, search one thing in one window, switch to another window
and search for something else. Switch back and forth and the searchterm is
updated to the one pertaining to the respective window.


Wait, what? Why?
----------------
Imagine you want to trace a variable trough a codebase:
 * You start in *file 1* and search for all occurences of *variable A*
 * *Variable A* is assigned to *variable B* and *variable C* so you need to
   trace those as well. With **Toggleterm** you just press ` * ` on *B* and *C*
   and search for these, too.
 * *Variable B* is fed into a function in *file 2* as *variable D*. So you hit
   the key to switch to **Localsearch** and open *file 2*. There you search for
   *variable D*.
 * When you focus *file 1* again, Localsearch takes care of switching the
   searchword back to the on you had in that window.
 * FANCY


How do I use it?
----------------
1. Install it using your favorite plugin manager, e.g. `Plug 'mox-mox/vim-localsearch'` for vim-plug.
2. Copy the mappings in :help localsearch-recommended into your .vimrc/init.vim
3. If you use vim-airline and want a visual indicator when localsearch is
   active, copy the experimental vim-airline extension file to the
   vim-airline/autoload/airline/extensions folder.
	* EITHER set g:airline_extensions to include 'localsearch'. Remember to
	  include all vim-airline extensions you want loaded as vim-airline will
	  only load the specified extensions if the g:airline_extensions is set.
	* OR apply the patch in
	  vim-airline/autoload/add_localsearch_autoloading.path to add autoloading
	  for the localsearch vim-airline extension.
4. Open a file, hit \<leader\>/ to enable localsearch. Open a split, move the
   cursor over a word and press ` * `. Vim will search for that word as it would
   without localsearch. Now, move the cursor over another word and press ` * ` again.
   Instead of replacing the search term, Vim will now search for both terms.
5. Now, move back to the first split window. The search highlighting will
   disappear. Search for something, then move back to the second window. Your
   search in the second window will be re-activated. Fancy again!


Vim-Airline integration
-----------------------
I wrote a small extension to vim-airline that will show an indicator in the statusline when localsearch is activated. It should load automatically when you have both plugins installed and look like this:
![image](https://raw.githubusercontent.com/mox-mox/vim-localsearch/master/vim-airline-localsearch-indicator.png)
