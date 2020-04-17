#!/bin/bash

# sourced lists from...
# https://firebog.net

OUTPUT_FILE='./block_file.txt'

# empty the output file 
echo > ${OUTPUT_FILE}

for f in $(cat lists.txt)
do 
  echo "# ${f}"
  curl -sS -L --compressed ${f} | \
    grep -v '^#' | \
    sed -e 's/^0.0.0.0 *//' | \
    sed -e 's/^127.0.0.1 *//' | \
    sed -e 's/ #.*//' | \
    xargs -L 1 >> ${OUTPUT_FILE}
done
