#!/bin/bash

#check if bucket exists and not empty
gsutil -q stat gs://www.sps-cloud-rc.cloud/index.html

return_value=$?

if [[ $return_value == 0 ]]
then
    echo "File exist"
    gsutil rsync -d ./Website gs://www.sps-cloud-rc.cloud/
    echo "all file sync done"


else
    echo "creating new bucket"
    gsutil mb -l us www.sps-cloud-rc.cloud -p cloud-resume-challenge-385006
    echo "setting permission"
    gsutil iam ch  allUsers:objectViewer gs://www.sps-cloud-rc.cloud
    gsutil web set -m index.html gs://www.sps-cloud-rc.cloud
fi






