resource_name :rails_app
property :app_name, String, name_property: true
property :location, String, required: true
property :socket_path, String, required: true

action :create do
	# Configure nginx
	template "/etc/nginx/conf.d/locations/#{app_name}.conf" do
		source 'nginx/location.conf.erb'
		cookbook 'missing_ruby_machine'
		variables(:app_name => app_name, :app_location => location)
	end

	template "/etc/nginx/conf.d/upstreams/#{app_name}.conf" do
		source 'nginx/upstream.conf.erb'
		cookbook 'missing_ruby_machine'
		variables(:app_name => app_name, :app_socket_path => socket_path)
	end

	service 'nginx' do
		action :reload
	end
end

action :delete do

	# Remove nginx files
	file "/etc/nginx/conf.d/locations/#{app_name}.conf" do
		action :delete
	end

	file "/etc/nginx/conf.d/upstreams/#{app_name}.conf" do
		action :delete
	end

	service 'nginx' do
		action :reload
	end
end
