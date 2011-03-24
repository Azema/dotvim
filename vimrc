call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set hidden
set number
set vb t_vb=
set ts=4 sts=4 sw=4 expandtab
syntax on
command! Status echo "All systems are go!"

if has("autocmd")
    filetype plugin indent on
endif
