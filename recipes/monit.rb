#
# Cookbook Name:: missing_ruby_machine
# Recipe:: monit
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


# Install and configure monit
include_recipe 'poise-monit::default'

link '/etc/monitrc' do
  to '/etc/monit/monitrc'
end

monit 'monit' do
	daemon_interval 60
	event_slots 1000
end

template '/etc/monit/conf.d/nginx.conf' do
	source 'monit/service.conf.erb'
	variables(:process_name => 'nginx', :pid_file => '/var/run/nginx.pid')
end

service 'monit' do
	action :reload
end


# Add monit as a resource on nginx
template "/etc/nginx/conf.d/locations/monit.conf" do
	source 'nginx/location.conf.erb'
	variables(:app_name => 'monit', :app_location => 'monit')
end

template "/etc/nginx/conf.d/upstreams/monit.conf" do
	source 'nginx/upstream.conf.erb'
	variables(:app_name => 'monit', :app_socket_path => '/var/run/monit.sock')
end
