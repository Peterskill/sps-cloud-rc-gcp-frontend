#!/bin/bash

#check if bucket exists and not empty
gsutil -q stat gs://sps-cloud-rc.cloud/index.html

return_value=$?

if [[ $return_value == 0 ]]
then
    echo "File exist"
    gsutil rsync -d ./Website gs://sps-cloud-rc.cloud/
    echo "all file sync done"


else
    echo "creating new bucket"
    gsutil mb -l us sps-cloud-rc.cloud -p cloud-resume-challenge-385006
    echo "syncing files"
    gsutil rsync -d ./Website gs://sps-cloud-rc.cloud/
    echo "Done sycning"
    echo "setting permission"
    gsutil iam ch  allUsers:objectViewer gs://sps-cloud-rc.cloud
    gsutil web set -m index.html gs://sps-cloud-rc.cloud
fi






