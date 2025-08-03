" Highlight all function names
syntax match cCustomFunc /\w\+\s*(/me=e-1,he=e-1
syntax match cCustomComment "\v//.*$"
highlight def link cCustomFunc Title
highlight link cCustomComment WarningMsg
