#!/usr/bin/env bash

# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# "---------------------------------------------------------"
# "-                                                       -"
# "-  Enables PodSecurityPolicy on the cluster             _"
# "-                                                       -"
# "---------------------------------------------------------"

# Do no set exit on error, since the rollout status command may fail
set -o nounset
set -o pipefail

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT=""
CLUSTER_NAME=""
ZONE=""

# shellcheck source=./common.sh
source "$ROOT/common.sh"

# Enable PSP
echo "Enabling PodSecurityPolicy"
gcloud beta container clusters update "$CLUSTER_NAME" \
  --zone "$ZONE" \
  --enable-pod-security-policy
