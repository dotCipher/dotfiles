# git-prune-all
#
# * Will delete all fully merged local branches
#   and any closed remote branches.
# * User is prompted to continue before deleting.
# * Pass in -d or --dry-run to see what would happen without changing anything

function git-prune-all --description="Delete all fully merged local and remote branches"
    set -l DRY_RUN false
    for option in $argv
        switch "$option"
            case -d --dry-run
                set DRY_RUN true
            case \*
                printf "Error: unknown option %s\n" $option
                return 1
        end
    end

    # Detect default branch (main or master)
    set -l DEFAULT_BRANCH (git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@')
    if test -z "$DEFAULT_BRANCH"
        # Fallback: check if main exists, otherwise use master
        if git show-ref --verify --quiet refs/heads/main
            set DEFAULT_BRANCH main
        else
            set DEFAULT_BRANCH master
        end
    end

    # Make sure we're on the default branch first
    git checkout $DEFAULT_BRANCH > /dev/null 2>&1

    # Make sure we're working with the most up-to-date version
    git fetch

    # Prune obsolete remote tracking branches
    git remote prune origin

    # List all the branches that have been merged fully into the default branch,
    # and then delete them.
    set -l MERGED_LOCAL (git branch --merged origin/$DEFAULT_BRANCH | grep -v "$DEFAULT_BRANCH\$" | string trim)
    if test -n "$MERGED_LOCAL"
        echo
        echo "The following local branches are fully merged and will be removed:"
        echo $MERGED_LOCAL
        read --local --prompt-str "Continue (y/N)? " REPLY
        if test "$REPLY" = "y"
            for branch in $MERGED_LOCAL
                if test "$DRY_RUN" = "true"
                    echo "Would delete local branch: '$branch'"
                else
                    echo "Deleting local branch: '$branch'"
                    git branch --quiet --delete $branch
                end
            end
        end
    end

    # Now the same, but including remote branches.
    set -l MERGED_ON_REMOTE (git branch -r --merged origin/$DEFAULT_BRANCH | sed 's/ *origin\///' | grep -v "$DEFAULT_BRANCH\$")

    if test -n "$MERGED_ON_REMOTE"
        echo
        echo "The following remote branches are fully merged and will be removed:"
        echo $MERGED_ON_REMOTE
        read --local --prompt-str "Continue (y/N)? " REPLY
        if test "$REPLY" = "y"
            for branch in $MERGED_ON_REMOTE
                if test "$DRY_RUN" = "true"
                    echo "Would delete remote branch: '$branch'"
                else
                    echo "Deleting remote branch: '$branch'"
                    git push --quiet origin :$branch
                end
            end
        end
    end

    echo "Done!"
end
