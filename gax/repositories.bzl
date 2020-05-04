# Copyright 2019 Google LLC
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

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def com_google_gapic_generator_cpp_gax_repositories():
    _maybe(
        http_archive,
        name = "com_github_grpc_grpc",
        strip_prefix = "grpc-1.28.1",
        urls = ["https://github.com/grpc/grpc/archive/v1.28.1.tar.gz"],
        sha256 = "4cbce7f708917b6e58b631c24c59fe720acc8fef5f959df9a58cdf9558d0a79b",
    )

    _maybe(
        http_archive,
        name = "com_google_googleapis",
        strip_prefix = "googleapis-fea22b1d9f27f86ef355c1d0dba00e0791a08a19",
        urls = ["https://github.com/googleapis/googleapis/archive/fea22b1d9f27f86ef355c1d0dba00e0791a08a19.tar.gz"],
        sha256 = "957ef432cdedbace1621bb023e6d8637ecbaa78856b3fc6e299f9b277ae990ff",
    )

def _maybe(repo_rule, name, **kwargs):
    if name not in native.existing_rules():
        repo_rule(name = name, **kwargs)
