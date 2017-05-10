#
# Cookbook Name:: missing_ruby_machine
# Recipe:: add_rails_application
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
#

unless node[:rails_application]
	log 'Missing rails_application' do
		message 'The rails_application parameter is missing. Aborting rails_application recipe.'
		level :error
	end
	return
end

app_name = node[:rails_application][:app_name]
app_location = node[:rails_application][:app_location]
app_socket_path = node[:rails_application][:app_socket_path]

unless app_name && app_location && app_socket_path
	log 'Missing parameters' do
		message 'Either app_name, app_locaiton, or app_socket_path is missing. Aborting rails_application recipe.'
		level :error
	end
	return
end

template "/etc/nginx/conf.d/locations/#{app_name}.conf" do
	source 'nginx/location.conf.erb'
	variables(:app_name => app_name, :app_location => app_location)
end

template "/etc/nginx/conf.d/upstreams/#{app_name}.conf" do
	source 'nginx/upstream.conf.erb'
	variables(:app_name => app_name, :app_socket_path => app_socket_path)
end

service 'nginx' do
	action :reload
end
