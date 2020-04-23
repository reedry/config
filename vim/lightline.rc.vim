let g:lightline = {
  \   'colorscheme': 'default',
  \   'active': {
  \     'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \    },
  \   'component_function': {
  \     'gitbranch': 'LightLineBranch'
  \   },
  \   'mode_map': {
  \     'n' : 'Normal',
  \     'i' : 'Insert',
  \     'R' : 'Replace',
  \     'v' : 'Visual',
  \     'V' : 'V-Line',
  \     "\<C-v>": 'V-Block',
  \     'c' : 'Command',
  \     's' : 'Select',
  \     'S' : 'S-Line',
  \     "\<C-s>": 'S-Block',
  \     't': 'Terminal',
  \   },
  \ }

function! LightLineBranch() abort
  let l:branch = FugitiveHead()
  return l:branch == '' ? '' : printf('⌥ %s', l:branch)
endfunction
