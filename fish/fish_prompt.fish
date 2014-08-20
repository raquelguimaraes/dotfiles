set __fish_git_prompt_show_informative_status 1
set __fish_git_prompt_hide_untrackedfiles 1

set __fish_git_prompt_color_branch magenta bold
set __fish_git_prompt_showupstream "informative"
set __fish_git_prompt_char_upstream_ahead "↑"
set __fish_git_prompt_char_upstream_behind "↓"
set __fish_git_prompt_char_upstream_prefix ""

set __fish_git_prompt_char_stagedstate "●"
set __fish_git_prompt_char_dirtystate "✚"
set __fish_git_prompt_char_untrackedfiles "…"
set __fish_git_prompt_char_conflictedstate "✖"
set __fish_git_prompt_char_cleanstate "✔"

set __fish_git_prompt_color_dirtystate af0000
set __fish_git_prompt_color_branch cyan
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_invalidstate red
set __fish_git_prompt_color_untrackedfiles $fish_color_normal
set __fish_git_prompt_color_cleanstate green bold



function fish_prompt --description 'Write out the prompt'
	
	set -l last_status $status

	if not set -q __fish_prompt_normal
		set __fish_prompt_normal (set_color normal)
	end

	echo
	set_color -o 0087d7
	echo -n [
  	echo -n (date +%X)
	echo -n "] "

	# PWD
	set_color $fish_color_cwd
	echo -n (prompt_pwd)
	set_color normal

	printf '%s ' (__fish_git_prompt)

	if not test $last_status -eq 0
	set_color $fish_color_error
	end

	echo
	echo -n '$ '

end
