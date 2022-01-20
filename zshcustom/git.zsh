
function gplf() {
    # git pull 時に --set-upstream-to しろというエラーが出た時に自動処理させる

    # カレントブランチ名
    current_branch_name="$(git rev-parse --abbrev-ref @)"

    # リモートブランチを指定して git pull する
    git branch --set-upstream-to="origin/${current_branch_name}" "${current_branch_name}"
    git pull
}
