" set include=^\\s*\\(const\\\|let\\).*[=]\\{1\\}\\s*\\(require(\\)\\(\\'\\\|\\"\\)\\zs\\(.*\\)\\ze\\(\\'\\\|\\"\\)
set include=^\\s*\\(const\\\|let\\).*[=]\\{1\\}\\s*\\(require(\\)\\zs\\(.*\\)\\ze\\()\\)
function! JsInclude(fname)
    let filedir = expand('%:h')
    let filename = substitute(a:fname, "'", "", "g")
    " (1) Clean out the ' and "
    " (2) append the path to the current file expand('%:dadsddasd') + fname
    " (3) add suffixes
    " return filedir conccat filename
endfunction

setlocal includeexpr=JsInclude(v:fname)

