" check for Windows Subsystem Linux @ Work
let g:isWSL = system('less /proc/sys/kernel/osrelease | grep -ic Microsoft') > 0


