if type "appcenter" > /dev/null 2>&1; then
    __APPCENTER_COMPLETION_FILE="${ZSH_CACHE_DIR}/appcenter_completion"
    if [[ ! -f $__APPCENTER_COMPLETION_FILE ]]; then
        appcenter --completion >! $__APPCENTER_COMPLETION_FILE
    fi

    [[ -f $__APPCENTER_COMPLETION_FILE ]] && source $__APPCENTER_COMPLETION_FILE

    unset __APPCENTER_COMPLETION_FILE
fi
