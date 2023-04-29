#!/bin/bash

#check if bucket exists and not empty
gsutil -q stat gs://www.sps-cloud-rc/index.html

return_value=$?

if [[ $return_value == 0 ]]
then
    echo "deleting existing FE folder"
    gsutil rm -r gs://www.sps-cloud-rc
fi

gsutil mb gs://www.sps-cloud-rc/
echo "uploading FE folder"

gsutil cp -r ./* gs://www.sps-cloud-rc/

#allow public acess to the bucket
gsutil iam ch allUsers:objectViewer gs://www.sps-cloud-rc

#set default static page for the bucket
gsutil web set -m index.html -e 404.html gs://www.sps-cloud-rc