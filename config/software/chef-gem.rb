#
# Copyright 2012-2014 Chef Software, Inc.
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
#

# CACHE BUST - 1 (ohai 8.1.0 was pulled in and is a buggy dependency)

name 'chef-gem'
default_version '11.18.12'

dependency 'ruby'
dependency 'rubygems'
dependency 'libffi'

license url: "https://raw.githubusercontent.com/chef/chef/#{version}/LICENSE"


build do
  env = with_standard_compiler_flags(with_embedded_path)

  gem 'install rack' \
      " --version '1.6.4'" \
      " --bindir '#{install_dir}/embedded/bin'" \
      " --no-ri --no-rdoc", env: env

  gem 'install chef' \
      " --version '#{version}'" \
      " --bindir '#{install_dir}/embedded/bin'" \
      " --no-ri --no-rdoc", env: env
end
