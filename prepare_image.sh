#!/bin/bash

pushd helm
dir=`ls | awk '{print $0}'`
for item in ${dir}
do 
  for image in `helm install --debug --dry-run ${item} ${item} | grep image:`
  do
     echo ${image} 
     if [ ${image} != "image:" ]; then
	echo "docker tag ${image} phdgang/${image##*/}"
	echo "docker push phdgang/${image##*/}"
     fi
  done

done
