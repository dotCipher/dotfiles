function find-files
    if test (count $argv) -eq 0
        echo "Usage: find-files <pattern>"
        return 1
    end
    rg --files --glob "*$argv[1]*"
end

