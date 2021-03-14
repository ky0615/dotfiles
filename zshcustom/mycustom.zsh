alias adbd="adb devices"
alias jr="jq '.' -C"
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
alias tf="tail -f"
alias fig='docker-compose'
alias res='sed -e "s/\([][ '\'']\)/ /g"'

alias nodenv-update='nodenv update-version-defs'
alias nodenv-node-path='nodenv which node'