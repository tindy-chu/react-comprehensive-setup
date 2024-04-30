#!/bin/sh
lintCss() {
    yarn stylelint $1
    echo "\033[43m$1 \033[0m lintCss DONE"
}

# via cmd
if [ "$#" -gt 0 ]; then
    lintCss "$@"
fi
