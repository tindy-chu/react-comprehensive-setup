#!/bin/sh
if [[ -z $1 ]]; then
  echo "Missing \033[31mComponent Path\033[0m"
  exit 1
fi

DIR=${1##*/}

if [[ ! $DIR =~ ^[A-Z][A-Za-z0-9]+$ ]]; then
  echo "Component name must be \033[31mCamalCase\033[0m"
  exit 1
fi

DIR_PATH="./src/components/$1"
SCSS_PATH="$DIR_PATH/styles.module.scss"
TSX_PATH="$DIR_PATH/index.tsx"

if [[ -a $TSX_PATH ]]; then
  echo "\033[31mtsx\033[0m exists."
  exit 1
fi

if [[ -a $SCSS_PATH ]]; then
  echo "\033[31mscss\033[0m exists."
  exit 1
fi

mkdir -p $DIR_PATH

CLASS_NAME=${DIR}Container
echo ".${CLASS_NAME} {
  display: flex;
}" >$SCSS_PATH

echo "import { FC } from 'react'

import styles from './styles.module.scss'

type T${DIR}Props = null

const ${DIR}: FC<T${DIR}Props> = () => {
  return (
    <>
      <div className={styles.${CLASS_NAME}}></div>
    </>
  )
}
export default ${DIR}
" >$TSX_PATH
