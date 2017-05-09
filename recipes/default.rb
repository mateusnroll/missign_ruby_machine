#
# Cookbook Name:: missing_ruby_machine
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# Install nginx
yum_repository 'nginx' do
	description 'nginx'
	baseurl 'http://nginx.org/packages/mainline/centos/7/$basearch/'
	gpgcheck false
	enabled true
end

package 'nginx'
package 'sqlite-devel'
package 'nodejs'


# Install ruby 2.4.0
include_recipe 'ruby_rbenv::system'
include_recipe 'ruby_build::default'

rbenv_ruby '2.4.0'
rbenv_global '2.4.0'


# Install Puma
rbenv_gem 'puma'
