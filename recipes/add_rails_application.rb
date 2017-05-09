#
# Cookbook Name:: missing_ruby_machine
# Recipe:: add_rails_application
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
#

app_name = node[:rails_application][:app_name]
app_location = node[:rails_application][:app_location]
app_socket_path = node[:rails_application][:app_socket_path]

template "/etc/nginx/conf.d/locations/#{app_name}.conf" do
	source 'location.conf.erb'
	variables(:app_name => app_name, :app_location => app_location)
end

template "/etc/nginx/conf.d/upstreams/#{app_name}.conf" do
	source 'upstream.conf.erb'
	variables(:app_name => app_name, :app_socket_path => app_socket_path)
end
