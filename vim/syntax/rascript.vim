" if exists("b:current_syn")
"  finish
"endif

syn match comment "\/\/.*$" contains=todo
syn keyword todo contained TODO FIXME

" Keywords
syn keyword scriptKeywords if else return function
syn keyword scriptRepeat for in

" Highlight function definitions
syn match scriptFunctionName /\<\K\k*\ze[\s\n]*(/ nextgroup=scriptFunctionParams

syn region scriptFunctionParams start=/(/ end=/)/ contains=scriptParam,delimiters,scriptNumbers,scriptString,scriptFunctionName
syn match scriptParam /[(,]?\K\k*\ze[\s=)]+/ contained skipwhite transparent
syn match delimiters /[,:]/ skipwhite skipempty

syn region object start="{" end="}" contains=objectKey,objectValue,delimiters,scriptNumbers,scriptString,scriptKeywords,scriptFunctionName,scriptFunctionParams
syn match objectKey "\<\K\k*\ze\s*:" contained nextgroup=objectValue
syn match objectValue "\s*\<\K\k*\ze\s*[},]" contained transparent contains=object,scriptNumber,scriptString 

" Highlight arrow function definitions
" syn match scriptArrowFunctionName /\w\+/ nextgroup=scriptArrow
syn match scriptOperator "\v\=>"
syn match scriptOperator "\v\="
syn match scriptOperator "\v\+"
syn match scriptOperator "\v\-"
syn match scriptOperator "\v\*"
syn match scriptOperator "\v\/"
syn match scriptOperator "\v\%"
syn match scriptOperator "\v\&"
syn match scriptOperator "\v\^"
syn match scriptOperator "\v\~"

syn match scriptOperator "\v\=\="
syn match scriptOperator "\v\!\="
syn match scriptOperator "\v\>"
syn match scriptOperator "\v\>\="
syn match scriptOperator "\v\<"
syn match scriptOperator "\v\<\="

syn match scriptOperator "\v\&\&"
syn match scriptOperator "\v\|\|"
syn match scriptOperator "\v\!"

" Numbers
syn match scriptNumbers "\<0[xX][0-9a-fA-F]\+\(_[0-9a-fA-F]\+\)*\>"
syn match scriptNumbers "\<\d\+\>"

" Regions
syn region scriptString start=+"+  skip=+\\"+  end=+"+ 

let b:current_syn = "rascript"

" hi def link scriptFunctionDef       Keyword
hi def link scriptFunctionName      Function
hi def link scriptFunctionParams    Identifier
hi def link scriptParam             Identifier
hi def link objectKey               Identifier

hi def link scriptOperator          Operator
" hi def link namedParam              Identifier
" hi def link paramEquals             Delimiter
hi def link delimiters              Noise

" hi def link scriptArrow             Delimiter
" hi def link scriptArrowFunctionName Function

" hi def link varName         Identifier

hi def link todo            Todo
hi def link comment         Comment
hi def link scriptKeywords  Keyword
hi def link scriptRepeat    Repeat
"hi def link scriptBraces		Function

hi def link scriptString    String
hi def link scriptNumbers   Number
