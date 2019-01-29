# git-clean-branches
#
# * Will delete all fully merged local branches
#   and any closed remote branches.
# * User is prompted to continue before deleting.
# * Pass in -d or --dry-run to see what would happen without changing anything

function git-prune-all --description="Delete all fully merged local and remote branches"
    for option in $argv
        switch "$option"
            case -d --dry-run
                set DRY_RUN true
            case \*
                printf "Error: unknown option %s\n" $option
        end
    end

    #  Make sure we're on master first
    git checkout master > /dev/null ^&1

    # Make sure we're working with the most up-to-date version of master.
    git fetch

    # Prune obsolete remote tracking branches. These are branches that we
    # once tracked, but have since been deleted on the remote.
    git remote prune origin

    # List all the branches that have been merged fully into master, and
    # then delete them. We use the remote master here, just in case our
    # local master is out of date.
    set -l MERGED_LOCAL (git branch --merged origin/master | grep -v 'master$' | string trim)
    if test -n "$MERGED_LOCAL"
        echo
        echo "The following local branches are fully merged and will be removed:"
        echo $MERGED_LOCAL
        read --local --prompt-str "Continue (y/N)? " REPLY
        if test "$REPLY" = "y"
            for branch in $MERGED_LOCAL
                if test $DRY_RUN
                    echo "Would delete local branch: '$branch'"
                else
                    echo "Deleting local branch: '$branch'"
                    git branch --quiet --delete $branch
                end
            end
        end
    end

    # Now the same, but including remote branches.
    set -l MERGED_ON_REMOTE (git branch -r --merged origin/master | sed 's/ *origin\///' | grep -v 'master$')

    if test -n "$MERGED_ON_REMOTE"
        echo
        echo "The following remote branches are fully merged and will be removed:"
        echo $MERGED_ON_REMOTE
        read --local --prompt-str "Continue (y/N)? " REPLY
        if test "$REPLY" = "y"
            for branch in $MERGED_ON_REMOTE
                if test $DRY_RUN
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
