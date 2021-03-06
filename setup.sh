#!/bin/sh

set -e

vagrant up

until ./fly -t pipelines login -c http://192.168.100.4:8080
do
  echo "Wating for VM to boot..."
done

echo y | ./fly -t pipelines set-pipeline -p jvm-test-deploy-pws -c pipelines/jvm-test-deploy-pws/pipeline.yml

echo ""
echo ""
echo "Everything is booted up! Visit http://192.168.100.4:8080 to view Concourse."
