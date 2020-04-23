let g:lightline = {
  \   'colorscheme': 'powerline_modified',
  \   'active': {
  \     'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
  \             [ 'errors', 'warnings' ] ]
  \    },
  \   'component_function': {
  \     'gitbranch': 'LightLineBranch'
  \   },
  \   'component_expand': {
  \     'errors': 'LightLineErrors',
  \     'warnings': 'LightLineWarnings'
  \   },
  \   'component_type': {
  \     'errors': 'error',
  \     'warnings': 'warning'
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

function! LightLineErrors() abort
  let l:counts = lsp#ui#vim#diagnostics#get_buffer_diagnostics_counts()
  return l:counts.error == 0 ? '' : printf('✗ %d', l:counts.error)
endfunction

function! LightLineWarnings() abort
  let l:counts = lsp#ui#vim#diagnostics#get_buffer_diagnostics_counts()
  return l:counts.warning == 0 ? '' : printf('‼ %d', l:counts.warning)
endfunction

augroup lightline_diagnostic
  autocmd!
  autocmd User lsp_diagnostics_updated call lightline#update()
augroup END
