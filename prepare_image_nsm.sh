#!/bin/bash

pushd helm
for image in `helm install --debug --dry-run nsm nsm | grep image:`
  do
     echo ${image} 
     if [ ${image} != "image:" ] && [ ${image} != "kernel-forwarder" ] && [ ${image} != "vppagent-forwarder" ]; then
	docker tag ${image} phdgang/${image##*/}
	docker push phdgang/${image##*/}
     fi
  done

