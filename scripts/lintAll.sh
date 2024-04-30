#!/bin/sh
lintAll() {
    yarn prettier --check $1
    echo "\033[43m$1 \033[0m lintAll DONE"
}

# via cmd
if [ "$#" -gt 0 ]; then
    lintAll "$@"
fi
