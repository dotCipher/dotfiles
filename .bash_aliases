# Navigation
## Changing directories
alias ..="cd .."
alias ...="cd ../.."
alias ..2="cd ../.."
alias ....="cd ../../.."
alias ..3="cd ../../.."
alias .....="cd ../../../.."
alias ..4="cd ../../../.."
alias ......="cd ../../../../.."
alias ..5="cd ../../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"
## Managing directories
alias pu="pushd"
alias po="popd"
alias cpwd='pwd | tr -d "\n" | pbcopy'


# Output
## Quick clear
alias c="clear"
alias cl="clear && ls"
## Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi
## List all files colorized in long format
alias l="ls -lF ${colorflag}"
## List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"
## List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
## Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
## Print path variable in formatted fashion
alias path='echo -e ${PATH//:/\\n}'
## Show history
# Show history
if [ "$HIST_STAMPS" = "mm/dd/yyyy" ]
then
    alias history='fc -fl 1'
elif [ "$HIST_STAMPS" = "dd.mm.yyyy" ]
then
    alias history='fc -El 1'
elif [ "$HIST_STAMPS" = "yyyy-mm-dd" ]
then
    alias history='fc -il 1'
else
    alias history='fc -l 1'
fi


# Sudo stuff
## Enable aliases to be sudo’ed
alias sudo='sudo '
## Shortcuts
alias _='sudo'
alias please='sudo !!'


# Networking
## IP addresses
alias ipv4="dig +short myip.opendns.com @resolver1.opendns.com"
alias ip="ipv4"
alias localip="ipconfig getifaddr en0"
## View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="lwp-request -m '$method'"
done
# Download Cert (ie. getcert google.com:443 > google.crt)
function getcert() {
    openssl s_client -showcerts -connect $1 </dev/null 2>/dev/null|openssl x509 -outform PEM
}
## URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'


# Git
alias clone="git clone"
alias grhh="git reset HEAD --hard"
alias gco="git checkout"
## Generate gitignore files dynamically (ie: gi java,osx > .gitignore)
function gi() {
    curl -L -s https://www.gitignore.io/api/$@ ;
}


# Code / Development
alias idea="open *.ipr"
## Gradlew
alias gw='./gradlew'
alias gwcc='./gradlew clean check'
alias gwccp='./gradlew clean check --parallel'
alias gwb='./gradlew build'
alias gwbp='./gradlew build --parallel'
alias gwi='./gradlew cleanIdea idea'
alias gwidea='./gradlew cleanIdea idea && sleep 1 && open *.ipr'
## JavaScriptCore REPL
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc";
[ -e "${jscbin}" ] && alias jsc="${jscbin}";
unset jscbin;

# Time / Date
## Get week number
alias week='date +%V'
## Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'


# Housecleaning
## Update all the things!
alias update='sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g;'
## Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
## Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"


# OSX System Controls
## Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
## Enable Spotlight
alias spoton="sudo mdutil -a -i on"
## Turn on Screen Saver (when going AFK)
alias afk="open -a ScreenSaverEngine"
## Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
## Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"


# Misc Utilities
## Generate random password of n characters
function password() {
    local DEFAULT_LENGTH=12
    local DEFAULT_CHARACTER_SET='A-Za-z0-9'
    local length=$DEFAULT_LENGTH
    local character_set=$DEFAULT_CHARACTER_SET
    if [[ $1 ]]; then
        length=$1
    fi
    if [[ $2 ]]; then
        character_set=$2
    fi
    pass=$(< /dev/urandom tr -dc "${character_set}" | head -c "${length}")
    echo -n $pass | pbcopy
    echo "Password of size $length and charset: '${character_set}' copied to clipboard"
}
## Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"
## OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"
## OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"
## Merge PDF files
## Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'
## Intuitive map function
## For example, to list all directories that contain a certain file:
## find . -name .gitattributes | map dirname
alias map="xargs -n1"
## Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"
## Kill all the tabs in Chrome to free up memory
## [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"


# For the LULZ
alias matrix='LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"'
alias stfu="osascript -e 'set volume output muted true'"

