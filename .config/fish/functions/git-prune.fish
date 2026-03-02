function git-prune
	set -l DEFAULT_BRANCH (git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@')
	if test -z "$DEFAULT_BRANCH"
		if git show-ref --verify --quiet refs/heads/main
			set DEFAULT_BRANCH main
		else
			set DEFAULT_BRANCH master
		end
	end
	git branch --merged | grep -Ev "(^\*|$DEFAULT_BRANCH|develop)" | xargs git branch -d
end
