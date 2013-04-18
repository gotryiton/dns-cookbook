#
# Cookbook Name:: dns
# Recipe:: default
#
# Copyright 2013, Go Try It On, Inc.
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

node.set_unless['dns']['name'] = node.name

execute "Set domain name" do
  command "echo '#{node.dns.domain}' >> /etc/domainname"
  not_if "grep -ri '#{node.dns.domain}' /etc/domainname"
end

execute "Set hostname" do
  command "echo '#{node.name}' > /etc/hostname && hostname #{node.fqdn}"
  not_if "grep -ri '#{node.name}' /etc/hostname"
end
