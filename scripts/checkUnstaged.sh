checkUnstaged() {
    for FILE in $1; do
        # check if any changes have not been staged in $FILE
        if [ -n "$(git diff --name-only $FILE)" ]; then
            UNSTAGED_FILES="$UNSTAGED_FILES $FILE"
        fi
    done

    # prevent commit if any changes have not been staged
    if [ -n "$UNSTAGED_FILES" ]; then
        UNSTAGED_FILES=$(echo "$UNSTAGED_FILES" | cut -c2-)
        echo "\033[41m Not staged changes in $UNSTAGED_FILES \033[0m"
        echo "Considering run \033[34mgit add $UNSTAGED_FILES\033[0m"
        exit 1
    fi
}
