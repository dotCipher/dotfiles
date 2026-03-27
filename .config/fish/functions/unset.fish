function unset
    for var in $argv
        set -e $var
    end
end
