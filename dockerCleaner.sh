#!/bin/bash

imgs=$(docker images | awk '/<none>/ { print $3 }')
if [ "${imgs}" != "" ]; then
   echo docker rmi ${imgs}
   docker rmi ${imgs}
else
   echo "No images to remove"
fi

procs=$(docker ps -a -q --no-trunc)
if [ "${procs}" != "" ]; then
   echo docker rm ${procs}
   docker rm ${procs}
else
   echo "No processes to purge"
fi
