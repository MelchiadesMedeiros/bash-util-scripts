#!/bin/bash
# ---------------------------------------------
# ecs-stop-task.sh
#
# Stop first task from ECS FARGATE
#
# Author: Fabio Szostak <fszostak@gmail.com> 
# Mon Sep 24 16:42:43 -03 2018
# ---------------------------------------------

if [ $# -eq 0 ]; then
	echo "use: $0 <ecs-cluster-name> [<ecs-service-name>]"

fi

CLUSTER=$1

if [ $# -eq 1 ]; then
	SERVICE=$2
else
	SERVICE=${CLUSTER}-service
fi

echo
echo "Cluster: $CLUSTER"
echo "Service: $SERVICE"
echo

echo "Stopping..."
aws ecs stop-task --cluster "$CLUSTER" --task $(aws ecs list-tasks --cluster "$CLUSTER" --service "$SERVICE" --output text --query taskArns[0])
echo
