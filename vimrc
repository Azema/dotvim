call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

""""""""""""""""""""""""""""""""""""""""""""""""""
" Fichier .vimrc de Nicolas Gressier
" Créé le 11 mai 2006
" Yoshidu62@gmail.com
" Mise à jour : 14/05/2010
" Version 2.7
""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""
"Diverses options
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                                  " désactivation de la compatibilité avec vi
set background=dark                               " fond sombre
colorscheme desert                                " couleur
syntax enable                                     " activation de la coloration syntaxique
set number                                        " numérotation des lignes
set autoindent                                    " indentation automatique avancée
set smartindent                                   " indentation plus intelligente
set laststatus=2                                  " ajoute une barre de status
set backspace=indent,eol,start                    " autorisation du retour arrière
set history=50                                    " historique de 50 commandes
set ruler                                         " affiche la position courante au sein du fichier
set showcmd                                       " affiche la commande en cours
set expandtab
set shiftwidth=4                                  " nombre de tabulation pour l'indentation
set softtabstop=4
set tabstop=4					  				  " nombre d'espace pour une tabulation
set showmatch                                     " vérification présence ([ ou { à la frappe de )] ou }
if has("autocmd")
    filetype plugin indent on                         " détection automatique du type de fichier
endif
autocmd FileType text setlocal textwidth=72       " les fichiers de type .txt sont limites à 72 caractères par ligne
autocmd FileType php setlocal textwidth=120       " les fichiers de type .php sont limites à 120 caractères par ligne
set fileformats=unix,mac,dos                      " gestion des retours chariot en fonction du type de fichier
set viewdir=~/.vim/saveview/                      " répertoire pour sauvegarder les vues, utiles pour les replis manuels
set foldcolumn=2                                  " repère visuel pour les folds
let Tlist_Ctags_Cmd = '/usr/bin/ctags'  	  " implémentation de ctags, nécessaire pour le plugin 'taglist'
set incsearch                                     " recherche incrémentale
set hlsearch                                      " surligne les résultats de la recherche
"set ignorecase                                    " ne pas prendre en compte la casse pour les recherches
set nolist					  					  " on n'affiche pas les caractères non imprimables
set listchars=eol:¶,tab:..,trail:~		  		  " paramétrage des caractères non imprimables au cas où l'on souhaiterait les afficher
set tags+=~/.vim/mytags/*


""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping pour désactiver le surlignage des
"résultats d'une recherche
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-N> :noh<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping pour naviguer dans les lignes coupées
""""""""""""""""""""""""""""""""""""""""""""""""""
map <A-DOWN> gj
map <A-UP> gk
imap <A-UP> <ESC>gki
imap <A-DOWN> <ESC>gkj



""""""""""""""""""""""""""""""""""""""""""""""""""
"Repositionner le curseur à l'emplacement de la
"dernière édition
""""""""""""""""""""""""""""""""""""""""""""""""""
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
 
 
 
""""""""""""""""""""""""""""""""""""""""""""""""""
"Chargement des types de fichiers
""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter *.txt set filetype=text             " chargement du type de fichier pour le format txt


""""""""""""""""""""""""""""""""""""""""""""""""""
" Check syntax when saving a buffer
""""""""""""""""""""""""""""""""""""""""""""""""""
augroup CheckSyntaxOnSave
    autocmd BufWritePost *.php !php -d display_errors=on -l <afile> 
    autocmd BufWritePost *.inc !php -d display_errors=on -l <afile>
    autocmd BufWritePost *.phtml !php -d display_errors=on -l <afile>
    autocmd BufWritePost *.thtml !php -d display_errors=on -l <afile>
    autocmd BufWritePost *.ctp !php -d display_errors=on -l <afile>
    autocmd BufWritePost *httpd*.conf !/etc/rc.d/init.d/httpd configtest
    autocmd BufWritePost *.bash !bash -n <afile>
    autocmd BufWritePost *.sh !bash -n <afile>
    autocmd BufWritePost *.pl !perl -c <afile>
    autocmd BufWritePost *.perl !perl -c <afile>
    autocmd BufWritePost *.xml !xmllint --noout <afile>
    autocmd BufWritePost *.xsl !xmllint --noout <afile>
    autocmd BufWritePost *.js !~/jslint/jsl -conf ~/jslint/jsl.default.conf -nologo -nosummary -process <afile>
    autocmd BufWritePost *.rb !ruby -c <afile>
    autocmd BufWritePost *.py !python -c "import py_compile; py_compile.compile(r'<afile>')"
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""
" Detect file types
""""""""""""""""""""""""""""""""""""""""""""""""""
augroup FileTypeDetect
    autocmd BufRead,BufNewFile *httpd*.conf setfiletype apache "Apache config files
    autocmd BufRead,BufNewFile .htaccess    setfiletype apache "htaccess files
    autocmd BufRead,BufNewFile *inc         setfiletype php "PHP include files
    autocmd BufRead,BufNewFile *phtml       setfiletype php "Zend framework templates
    autocmd BufRead,BufNewFile *thtml       setfiletype php "CakePHP templates
    autocmd BufRead,BufNewFile *ctp         setfiletype php "CakePHP templates
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""
"Omni-completion par CTRL-X_CTRL-O
""""""""""""""""""""""""""""""""""""""""""""""""""
au filetype html        set omnifunc=htmlcomplete#CompleteTags
au filetype css         set omnifunc=csscomplete#CompleteCSS
au filetype javascript  set omnifunc=javascriptcomplete#CompleteJS
au filetype c           set omnifunc=ccomplete#Complete
au filetype php         set omnifunc=phpcomplete#CompletePHP
au filetype ruby        set omnifunc=rubycomplete#Complete
au filetype sql         set omnifunc=sqlcomplete#Complete
au filetype python      set omnifunc=pythoncomplete#Complete
au filetype xml         set omnifunc=xmlcomplete#CompleteTags

""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoComplCache configuration
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup            = 1
let g:neocomplcache_enable_smart_case            = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion   = 1
let g:neocomplcache_min_syntax_length            = 2
let g:neocomplcache_lock_buffer_name_pattern     = '\*ku\*'

let g:neocomplcache_dictionary_filetype_lists = { 
    \ 'default'  : '',
    \ 'vimshell' : $HOME . '/.vimshell_hist',
    \ 'scheme'   : $HOME . '/.gosh_completions'
    \ } 

if !exists('g:neocomplcache_keyword_patterns') 
    let g:neocomplcache_keyword_patterns = {} 
endif 
let g:neocomplcache_keyword_patterns['default'] = '\h\w*' 


""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP specials (next/previous variable)
""""""""""""""""""""""""""""""""""""""""""""""""""
noremap L f$ 
noremap H F$

""""""""""""""""""""""""""""""""""""""""""""""""""
" Force the ZF filetype for PHP files
""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType php set ft=php.zf

""""""""""""""""""""""""""""""""""""""""""""""""""
" php documentor
""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRL + Space to pop up omnicomplete
""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-Space> <C-x><C-o>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Personnalisation PHP
""""""""""""""""""""""""""""""""""""""""""""""""""
" Options spécifique à la syntaxe html :
" Coloriser le html dans les chaines php
let php_htmlInStrings = 1
" Coloriser le SQL dans les chaines php
let php_sql_query = 1
let php_no_shorttags = 1
let php_folding = 0

""""""""""""""""""""""""""""""""""""""""""""""""""
" Ajout de l'analyser de code ZendCodeAnalyzer
" seulement pour php < 5.3
""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FileType php setlocal makeprg=zca\ %<.php
"autocmd FileType php setlocal errorformat=%f(line\ %l):\ %m


""""""""""""""""""""""""""""""""""""""""""""""""""
"Personnalisation de la barre de statut
""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%t%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [FENC=%{&fileencoding}]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]\ [TAG=%{Tlist_Get_Tagname_By_Line()}]



""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping pour l'activation de l'explorateur
"système
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F9> :NERDTree ~/<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping et configuration pour la liste des tags
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1		" vim se ferme si il reste uniquement la fenêtre des tags
let Tlist_Process_File_Always = 1	" activation permanente du plugin pour la barre de statut
let Tlist_Use_Right_Window = 1		" affiche les tags sur le côté droit de l'écran



""""""""""""""""""""""""""""""""""""""""""""""""""
"Sauvegarde automatique des vues, utiles pour les
"replis manuels
""""""""""""""""""""""""""""""""""""""""""""""""""
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview



""""""""""""""""""""""""""""""""""""""""""""""""""
"Map pour se déplacer dans les onglets
""""""""""""""""""""""""""""""""""""""""""""""""""
map <tab> gt



""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping pour insérer la date du jour
""""""""""""""""""""""""""""""""""""""""""""""""""
imap \date  <C-R>=strftime("%d/%m/%Y")<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping pour copier, couper, coller
"et sélectionner
""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-x> "+x
map <C-c> "+y
map <C-p> "+gP
map <C-a> ggVG



""""""""""""""""""""""""""""""""""""""""""""""""""
"Dictionnaire français
"Liste des propositions par CTRL-X_CTRL-K
""""""""""""""""""""""""""""""""""""""""""""""""""
set dictionary+=/usr/share/dict/french



""""""""""""""""""""""""""""""""""""""""""""""""""
"Correction orthographique
"Liste des propositions par CTRL-X_s
""""""""""""""""""""""""""""""""""""""""""""""""""
set spellsuggest=5                                   " on affiche uniquement les 5 premières propositions 
autocmd BufEnter *.txt set spell                     " correction orthographique dans les fichiers textes
autocmd BufEnter *.txt set spelllang=fr              " correction orthographique dans les fichiers textes


if has('balloon_eval')
    """"""""""""""""""""""""""""""""""""""""""""""""""
    "Infos-Bulles
    """"""""""""""""""""""""""""""""""""""""""""""""""
    function! FoldSpellBalloon()
        let foldStart = foldclosed(v:beval_lnum)
        let foldEnd = foldclosedend(v:beval_lnum)
        let lines = []
        "Detect if we are in a fold
        if foldStart < 0
            "Detect if we are on a misspelled word
            let lines = spellsuggest(spellbadword(v:beval_text)[0], 5, 0)
        else
            "We are in a fold
            let numLines = foldEnd - foldStart + 1
            "If we have too many lines in fold, show only the first 14
            "and the last 14 lines
            if(numLines > 31)
                let lines = getline(foldStart, foldStart + 14)
                let lines += ['-- Snipped ' . (numLines - 30) . ' lines --']
                let lines += getline(foldEnd - 14, foldEnd)
            else
                "Less than 30 lines, lets show all of them
                let lines = getline(foldStart, foldEnd)
            endif
        endif
        "Return result
        return join(lines, has("balloon_multiline") ? "\n" : " ")
    endfunction

    set balloonexpr=FoldSpellBalloon()
    set ballooneval
endif


""""""""""""""""""""""""""""""""""""""""""""""""""
"Nom du fichier en cours dans l'onglet pour Vim
""""""""""""""""""""""""""""""""""""""""""""""""""
function! ShortTabLine()
    let ret = ''
    for i in range(tabpagenr('$'))
	"Select the color group for highlighting active tab
	if i + 1 == tabpagenr()
	    let ret .= '%#errorMsg#'
	else
	    let ret .= '%#TabLine#'
	endif

	"Find the buffername for the tablabel
	let buflist = tabpagebuflist(i+1)
	let winnr = tabpagewinnr(i+1)
	let buffername = bufname(buflist[winnr - 1])
	let filename = fnamemodify(buffername, ':t')
	"Check if there is no name
	if filename == ''
	    let filename = 'noname'
	endif
	"Only show the first 18 letters of the name and
	".. if the filename is more than 20 letters long
	if strlen(filename) >= 8
	    let ret .= '['.filename[0:17].'..]'
	else
	    let ret .= '['.filename.']'
	endif
    endfor

    "After the last tab fill with TabLineFill and reset tab page #
    let ret .= '%#TabLineFill#%T'
    return ret
endfunction

set tabline=%!ShortTabLine()



""""""""""""""""""""""""""""""""""""""""""""""""""
"Modification de l'affichage des replis
""""""""""""""""""""""""""""""""""""""""""""""""""
function! MyFoldFunction()
    let line = getline(v:foldstart)
    "Cleanup unwanted things in first line
    let sub = substitute(line, '/\*\|\*/\|^\s+', '', 'g')
    "Calculate lines in folded text
    let lines = v:foldend - v:foldstart + 1
    return v:folddashes.sub.' {...'.lines.' Lines...}'
endfunction

set foldtext=MyFoldFunction()



""""""""""""""""""""""""""""""""""""""""""""""""""
"Poser une marque visible avec F7
""""""""""""""""""""""""""""""""""""""""""""""""""
hi Mark guibg=indianred guifg=white gui=bold cterm=bold ctermfg=7 ctermbg=1
sign define mark text=!> texthl=Mark
map <F7> :exe 'sign place 001 name=mark line='.line(".").' buffer='.winbufnr(0)<CR>
map <C-F7> :sign unplace<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""
"Couleur pour les templates
""""""""""""""""""""""""""""""""""""""""""""""""""
hi def link Todo TODO
syn keyword Todo TODO FIXME XXX DEBUG

