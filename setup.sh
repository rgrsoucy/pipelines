#!/bin/sh

set -e

vagrant up
sleep 10

until ./fly sync
do
  echo "Wating for VM to boot..."
done

echo y | ./fly set-pipeline -p jvm-test-deploy-pws -c pipelines/jvm-test-deploy-pws/pipeline.yml

echo ""
echo ""
echo "Everything is booted up! Visit 192.168.100.4:8080 to view Concourse."
