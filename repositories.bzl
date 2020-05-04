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

def com_google_gapic_generator_cpp_repositories():
    _maybe(
        http_archive,
        name = "absl",
        strip_prefix = "abseil-cpp-20200225.2",
        urls = ["https://github.com/abseil/abseil-cpp/archive/20200225.2.tar.gz"],
    )

    _maybe(
        http_archive,
        name = "com_google_protobuf",
        strip_prefix = "protobuf-3.11.3",
        urls = ["https://github.com/protocolbuffers/protobuf/archive/v3.11.3.tar.gz"],
        sha256 = "cf754718b0aa945b00550ed7962ddc167167bd922b842199eeb6505e6f344852",
    )

    _maybe(
        http_archive,
        name = "bazel_skylib",
        strip_prefix = "bazel-skylib-1.0.2",
        urls = ["https://github.com/bazelbuild/bazel-skylib/archive/1.0.2.tar.gz"],
        sha256 = "e5d90f0ec952883d56747b7604e2a15ee36e288bb556c3d0ed33e818a4d971f2",
    )

    _maybe(
        http_archive,
        name = "zlib",
        build_file = "@com_google_protobuf//:third_party/zlib.BUILD",
        sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
        strip_prefix = "zlib-1.2.11",
        urls = [
            "https://mirror.bazel.build/zlib.net/zlib-1.2.11.tar.gz",
            "https://zlib.net/zlib-1.2.11.tar.gz",
        ],
    )

    _maybe(
        http_archive,
        name = "gtest",
        strip_prefix = "googletest-release-1.8.1",
        urls = ["https://github.com/google/googletest/archive/release-1.8.1.tar.gz"],
    )

def _maybe(repo_rule, name, **kwargs):
    if name not in native.existing_rules():
        repo_rule(name = name, **kwargs)
