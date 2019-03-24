#!/bin/bash
. $(dirname "$0")/../utils/confirm.sh

docker images $1 | grep -v $2

confirm 'Remove the images above? [y/N]' && docker images $1 | grep -v $2 | awk '{print $3}' | uniq | xargs docker rmi
