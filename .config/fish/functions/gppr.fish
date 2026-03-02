function gppr
	set -l CURRENT_BRANCH (git branch --show-current)
	git push -u origin $CURRENT_BRANCH
	if test $status = 0
		if count $argv > /dev/null
			set -l PR_URL (gh pr create --fill --title "$argv" 2>&1 | tail -1)
		else
			set -l PR_URL (gh pr create --fill 2>&1 | tail -1)
		end
		echo "$PR_URL" | pbcopy
		echo "Opened PR: $PR_URL (and copied to clipboard!)"
	else
		echo "Not opening pull request, error occurred when pushing branch to remote."
	end
end
