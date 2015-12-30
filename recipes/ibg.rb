# Encoding: utf-8
#
# Cookbook Name:: elasticsearch
# Recipe:: default
#

include_recipe 'chef-sugar'

# see README.md and test/fixtures/cookbooks for more examples!
elasticsearch_user 'elasticsearch'
elasticsearch_install 'elasticsearch' do
  type node['elasticsearch']['install_type'].to_sym # since TK can't symbol.
end
elasticsearch_configure 'elasticsearch' do
  configuration(node['elasticsearch']['config'] || {})
end

elasticsearch_service 'elasticsearch'

# by default, no plugins
elasticsearch_plugin 'kopf' do
	url 'lmenezes/elasticsearch-kopf'
	action :install
end

elasticsearch_plugin 'head' do
  url 'mobz/elasticsearch-head'
  action :install
end

elasticsearch_plugin 'AWS' do
    url 'cloud-aws'
    action :install
end
