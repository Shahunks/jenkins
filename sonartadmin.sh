#!/bin/bash

PROJECTKEY="ng-tadmin"
QGSTATUS=`curl -s -u  admin:admin http://10.8.201.78:9000/api/qualitygates/project_status?projectKey=ng-tadmin-server | jq '.projectStatus.status' | tr -d '"'`
if [ "$QGSTATUS" = "OK" ]
then
echo "ok"
elif [ "$QGSTATUS" = "ERROR" ]
then
exit 1
fi 
