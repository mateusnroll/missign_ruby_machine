#
# Cookbook Name:: missing_ruby_machine
# Recipe:: add_rails_application
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

template '/etc/nginx/conf.d/default.conf' do
	source 'default.conf.erb'
end
