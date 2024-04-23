#!/bin/sh
JS_PATH="./env.js"
[ "$1" = "local" ] && JS_PATH="./public/env.js"

echo "window._env_ = {" > "$JS_PATH"

while IFS="=" read -r KEY VALUE; do
    ENV=$(eval "echo \$${KEY}")
    if [ "$1" = "local" ] || [ -z "$ENV" ]; then
      CUR=$VALUE
    else
      CUR=$ENV
    fi
    echo "  $KEY: \"$CUR\"," >> "$JS_PATH"
done < ".env"

echo "};" >> "$JS_PATH"
