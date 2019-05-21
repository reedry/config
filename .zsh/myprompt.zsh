myprompt_setup () {
  base_prompt="%F{cyan}%n@%m "
  post_prompt="%b%f%k"

  base_prompt_no_color=$(echo "$base_prompt" | perl -pe "s/%(K\{.*?}|k)//g")
  post_prompt_no_color=$(echo "$post_prompt" | perl -pe "s/%(K\{.*?}|k)//g")

  add-zsh-hook precmd myprompt_precmd
}

myprompt_precmd () {
  setopt noxtrace localoptions
  local base_prompt_expanded_no_color base_prompt_etc
  local prompt_length space_left

  base_prompt_expanded_no_color=$(print -P "$base_prompt_no_color")
  base_prompt_etc=$(print -P "$base_prompt%(4~|...|)%3~")
  prompt_length=${#base_prompt_etc}
  if [[ $prompt_length -lt 40 ]]; then
    path_prompt="%K%F{blue}%(4~|...|)%3~%k%f"
  else
    space_left=$(( $COLUMNS - $#base_prompt_expanded_no_color - 2 ))
    path_prompt="%K%F{blue}%${space_left}<...<%~$prompt_newline%k%f"
  fi
  PS1="$base_prompt$path_prompt %# $post_prompt"
  PS2="$base_prompt$path_prompt %_> $post_prompt"
  PS3="$base_prompt$path_prompt ?# $post_prompt"
}

myprompt_setup "$@"
