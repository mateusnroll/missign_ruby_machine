#
# Cookbook Name:: missing_ruby_machine
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# Create directories
sockets_dir = '/tmp/sockets'
pid_dir = '/tmp/pid'

directory sockets_dir do
	owner 'root'
	group 'root'
	recursive true
end

directory pid_dir do
	owner 'root'
	group 'root'
	recursive true
end

# Install nginx
yum_repository 'nginx' do
	description 'nginx'
	baseurl 'http://nginx.org/packages/mainline/centos/7/$basearch/'
	gpgcheck false
	enabled true
end

package 'nginx'

# Install yum dependencies
package 'epel-release'
package 'sqlite-devel'
package 'nodejs'


# Install ruby 2.4.0
include_recipe 'ruby_rbenv::system'
include_recipe 'ruby_build::default'

rbenv_ruby '2.4.0'
rbenv_global '2.4.0'


# Install Puma
rbenv_gem 'puma'

# Install rails and bundler
rbenv_gem 'rails'
rbenv_gem 'bundler'
