#!/bin/sh
lintJs() {
    JS_FILES=$1

    yarn eslint $JS_FILES

    # Generate tsconfig.tmp.json and update the "include" to $JS_FILES with src/vite-env.d.ts
    TMP=tsconfig.tmp.json
    echo '{
  "extends": "./tsconfig.json",
  "include": [' >$TMP
    for JS_FILE in $JS_FILES; do
        echo "      \"$JS_FILE\"," >>$TMP
    done
    echo '      "src/vite-env.d.ts"' >>$TMP
    echo '  ]' >>$TMP
    echo '}' >>$TMP

    yarn tsc -p tsconfig.tmp.json
    rm tsconfig.tmp.json

    echo "\033[43m$JS_FILES \033[0m lintJs DONE"
}

# via cmd
if [ "$#" -gt 0 ]; then
    lintJs "$@"
fi
