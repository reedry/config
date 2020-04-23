let g:lightline = {
  \   'colorscheme': 'default',
  \   'active': {
  \     'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \    },
  \   'component_function': {
  \     'gitbranch': 'LightLineBranch'
  \   },
  \ }

function! LightLineBranch() abort
  let l:branch = FugitiveHead()
  return l:branch == '' ? '' : printf('⌥ %s', l:branch)
endfunction
