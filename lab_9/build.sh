#!/bin/bash

function initializeProject {
  PROJECT_ID=$2
  COMPUTE_ZONE=$3
  echo "Initializing GCP Project $PROJECT_ID"
  gcloud config set project "$PROJECT_ID"
  gcloud config set compute/zone "$COMPUTE_ZONE"
}

function createCluster {
  NAME=$2
  NUM_NODES=$3
  gcloud container clusters create "$NAME" --num-nodes="$NUM_NODES"
  gcloud container clusters get-credentials "$NAME"
}

function build {
  DOCKER_IMAGE=gcr.io/bbk-dev/hdp-gke:1.0.0
  gcloud builds submit --tag "$DOCKER_IMAGE" .
  kubectl apply -f ctl/deployment.yaml
}

###

for arg in "$@"; do
  if [[ "$arg" = -i ]] || [[ "$arg" = --initialize-project ]]; then
    ARG_INITIALIZE_PROJECT=true
  fi
  if [[ "$arg" = -c ]] || [[ "$arg" = --create-cluster ]]; then
    ARG_CREATE_CLUSTER=true
  fi
  if [[ "$arg" = -a ]] || [[ "$arg" = --build ]]; then
    ARG_BUILD=true
  fi
done

###

if [[ "$ARG_INITIALIZE_PROJECT" = true ]]; then
  initialize "$@"
fi

if [[ "$ARG_CREATE_CLUSTER" = true ]]; then
  createCluster
fi

if [[ "$ARG_BUILD" = true ]]; then
  build
fi
