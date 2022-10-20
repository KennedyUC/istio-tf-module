#!/bin/bash

set -euo pipefail

function log {
  echo "$@"
  return 0
}

NAMESPACE=istio-system

# create istio-system namespace
NS=$(kubectl get namespace $NAMESPACE --ignore-not-found);
if [[ "$NS" ]]; then
  log "✅ Skipping creation of namespace $NAMESPACE - already exists";
else
  log "✅ Creating namespace $NAMESPACE";
  sudo kubectl create namespace $NAMESPACE;
fi;