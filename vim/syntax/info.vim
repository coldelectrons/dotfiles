" Vim syntax file
" Language:	INFO - the file format from boost property-trees
" Maintainer:	Thomas Fritz
" Last Change:	2012-3-3
" Version:      0.4
" {{{1

" Syntax setup {{{2
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'info'
endif

" Syntax: Strings {{{2
syn region  infoString  start=+"+  skip=+\"\|\;+  end=+"+  contains=infoEscape
"syn region  infoKey     start=+(^[\s].*)+  skip=+\\\\\|\\"+  end=+"+
syn match   infoKey +\(^\s*\)\@<=\<\k*\>+
syn region  infoComment start=+;+ keepend end=+$+
syn keyword infoInclude #include
" Syntax: JSON does not allow strings with single quotes, unlike JavaScript.
"syn region  infoStringSQ  start=+'+  skip=+\\\\\|\\"+  end=+'+

" Syntax: Escape sequences {{{3
syn match   infoEscape    "\\["\\/bfnrt]" contained
syn match   infoEscape    "\\u\x\{4}" contained

" Syntax: Strings should always be enclosed with quotes.
syn match   infoNoQuotes  "\<\a\+\>"

" Syntax: Numbers {{{2
syn match   infoNumber    "-\=\<\%(0\|[1-9]\d*\)\%(\.\d\+\)\=\%([eE][-+]\=\d\+\)\=\>"

" Syntax: An integer part of 0 followed by other digits is not allowed.
syn match   infoNumError  "-\=\<0\d\.\d*\>"
 
" Syntax: Boolean {{{2
syn keyword infoBoolean   true false
 
" Syntax: Null {{{2
syn keyword infoNull      null
 
"  Syntax: Braces {{{2
syn match   infoBraces	   "[{}]"

"  Define the default highlighting. {{{1 
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_info_syn_inits")
  if version < 508
    let did_info_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink infoKey                Special
  HiLink infoString             String
  HiLink infoEscape             Special
  HiLink infoNumber		Number
  HiLink infoBraces		Operator
  HiLink infoNull		Function
  HiLink infoBoolean		Boolean
  HiLink InfoComment            Comment

  HiLink infoNumError           Error
"  HiLink infoStringSQ           Error
"  HiLink infoNoQuotes           Error
  delcommand HiLink
endif

let b:current_syntax = "info"
if main_syntax == 'info'
  unlet main_syntax
endif

" Vim settings {{{2
" vim: ts=8 fdm=marker
