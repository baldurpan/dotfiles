autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
	git="$commands[git]"
else
	git="/usr/bin/git"
fi

git_branch() {
	local s="$($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})"
	echo s
}

git_dirty() {
	if $(! $git status -s &> /dev/null)
	then
		echo ""
	else
		if [[ $($git status --porcelain) == "" ]]
		then
			echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}$(sprout_version)"
		else
			echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}$(sprout_version)"
		fi
	fi
}

git_prompt_info () {
	ref=$($git symbolic-ref HEAD 2>/dev/null) || return
	# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
	echo "${ref#refs/heads/}"
}

unpushed () {
	$git cherry -v @{upstream} 2>/dev/null
}

need_push () {
	if [[ $(unpushed) == "" ]]
	then
		echo " "
	else
		echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
	fi
}

sprout_version() {
  if ! type "$sprout" > /dev/null;
  then
    echo " %{$fg_bold[yellow]%}$(sprout version)%{$reset_color%}"
  fi
}

directory_name() {
	echo "%{$fg_bold[cyan]%}${PWD/#$HOME/~}%{$reset_color%}"
}

host_name() {
	echo "%{$fg[yellow]%}%m%{$reset_color%}"
}

export PROMPT=$'\nin $(directory_name) $(git_dirty)$(need_push)\n› '
set_prompt () {
	export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
	title "zsh" "%m" "%55<...<%~"
	set_prompt
}
