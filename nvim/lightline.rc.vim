let g:lightline = {
  \   'colorscheme': 'PaperColor',
  \   'active': {
  \     'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
  \             [ 'errors', 'warnings' ] ],
  \     'right': [ [ 'lineinfo' ],
  \                [ 'percent' ],
  \                [ 'eskk', 'fileformat', 'fileencoding', 'filetype' ] ]
  \   },
  \   'component_function': {
  \     'gitbranch': 'LightLineBranch',
  \     'eskk': 'LightLineEskk'
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

function! LightLineEskk() abort
  if exists('eskk')
    if !eskk#is_enabled()
      return ''
    endif
    let l:modes = { 'hira': 'あ', 'kata': 'ア', 'ascii': 'A', 'zenei': '全' }
    return get(l:modes, eskk#get_mode(), '')
  endif
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
