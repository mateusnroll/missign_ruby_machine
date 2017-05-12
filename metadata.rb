name 'missing_ruby_machine'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures missing_ruby_machine'
long_description 'Installs/Configures missing_ruby_machine'
version '0.1.0'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
issues_url 'https://github.com/mateusnroll/missing_ruby_machine/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
source_url 'https://github.com/mateusnroll/missing_ruby_machine' if respond_to?(:source_url)

depends 'ruby_rbenv'
depends 'poise-monit'
