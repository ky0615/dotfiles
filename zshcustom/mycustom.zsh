alias adbd="adb devices"
alias jr="jq '.' -C"
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
alias tf="tail -f"
alias fig='docker-compose'
alias res='sed -e "s/\([][ '\'']\)/\\\\\1/g"'
alias filename="sed -E 's/^([\/]?.*\/)*(.*)\..*$/\2/'"

alias nodenv-update='nodenv update-version-defs'
alias nodenv-node-path='nodenv which node'
alias kgsa='kubectl get svc --all-namespaces'
