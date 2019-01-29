function gppr
	set -l CURRENT_BRANCH (git branch | grep \* | cut -d ' ' -f2)
	git push -u origin  $CURRENT_BRANCH
	if test $status = 0
		if count $argv > /dev/null
			set -g PR_URL (git pull-request -m "$argv")
		else
			set -l LAST_COMMIT_MESSAGE (git log -1 --pretty=%B)
			set -g PR_URL (git pull-request -m "$LAST_COMMIT_MESSAGE")
		end
		echo "$PR_URL" | pbcopy
		echo -e "Opened PR: $PR_URL (and copied to clipboard!)"
		set -e PR_URL
	else
		echo "Not opening pull request, error occured when pushing branch to remote."
	end
end

