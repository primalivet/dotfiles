" Include search for Javascript

" The include pattern below matches the following (as of what I've manually
" tested). It seems sufficient to use basic :dj / :ij commands.
"
" var name = require('filename')
" const { xxx } = require('filename')
" const { xxx, yyy } = require("filename")
"
" NOTE: However, :ij seem to jump to the import definition in the same file
" rather than to a 'real' definition in another file. But I guess that might be
" a problem connected to how Javascript import syntax work.
"
set include=^\\s*\\(const\\\|var\\\|let\\).*[=]\\{1\\}\\s*\\(require(\\)\\zs\\(.*\\)\\ze\\()\\)

" Add .js suffix when trying to find include files. Should be add typescript in
" here.
setlocal suffixesadd=.js,.jsx

" Include expression function
" This function (set below as includeexpr) takes a matched string (as of the
" include pattern the match should be whats between ( and ) when using require.
function! JsInclude(fname)
    let cleaned = substitute(a:fname, "'", "", "g")
    let parts = filter(split(cleaned, '/'), 'v:val != "." && v:val != "/"')
    let filepath = join(parts, '/')
    let path = findfile(filepath)
    if filereadable(path)
        return path
    else 
        return ''
    endif
endfunction

" Set the include expression (define expression is already valid for
" Javascript)
setlocal includeexpr=JsInclude(v:fname)

