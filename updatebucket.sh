#!/bin/bash

#check if bucket exists and not empty
gsutil -q stat gs://www.sps-cloud-rc.cloud/index.html

return_value=$?


gsutil rsync -d Website/* gs://www.sps-cloud-rc.cloud/

#allow public acess to the bucket
gsutil iam ch allUsers:objectViewer gs://www.sps-cloud-rc.cloud

#set default static page for the bucket
gsutil web set -m index.html gs://www.sps-cloud-rc.cloud