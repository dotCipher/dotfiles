
alias c "clear"

alias gw "./gradlew"

alias g "git"
alias gaa "git add ."
alias gcm "git commit -m"
alias gco "git checkout"
alias gp "git push"
alias gpo "git push -u origin (git branch | grep \* | cut -d ' ' -f2)"
alias clone "git clone"

alias nexus-port-forward "kubectl1.8 config set-context (kubectl1.8 config current-context) --namespace=utility; kubectl1.8 port-forward (kubectl1.8 -n utility get pods -l app=sonatype-nexus -o go-template --template '{{range .items}}{{.metadata.name}}{{\"\n\"}}{{end}}' | head -n1) 8080:8081"

