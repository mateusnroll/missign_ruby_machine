#
# Cookbook Name:: missing_ruby_machine
# Recipe:: add_rails_application
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

template '/etc/nginx/conf.d/default.conf' do
	source 'nginx/default.conf.erb'
end

directory '/etc/nginx/conf.d/locations' do
	owner 'root'
	group 'root'
	action :create
end

directory '/etc/nginx/conf.d/upstreams' do
	owner 'root'
	group 'root'
	action :create
end

service 'nginx' do
	action :start
end
