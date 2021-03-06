#!/bin/bash -e
#
# Copyright 2017 Heptio Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

SAVES=(
  k8s.io/kubernetes/cmd/libs/go2idl/client-gen
  k8s.io/kubernetes/cmd/libs/go2idl/lister-gen
  k8s.io/kubernetes/cmd/libs/go2idl/informer-gen
)

godep save ./... "${SAVES[@]}"

# remove files we don't want
find vendor \( -name BUILD -o -name .travis.yml \) -exec rm {} \;
