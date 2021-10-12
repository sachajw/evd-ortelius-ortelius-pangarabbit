# Copyright (c) 2021 Linux Foundation
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

#!/bin/sh

export TOMCAT_LIB=/workspace/tomcat7/lib
cd /build
export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
export PATH=$PATH:$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")/bin
export WORKSPACE=/workspace

om -l -f /workspace/tgt/java.mak CFG=DEBUG dh-ms-general.war | grep -v WARN
test $? -eq 0 || exit $?
