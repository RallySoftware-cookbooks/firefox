default['firefox']['version'] = '18.0.1'
default['firefox']['source_url'] = "https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/#{node['firefox']['version']}/linux-x86_64/en-US/firefox-#{node['firefox']['version']}.tar.bz2"
default['firefox']['path'] = '/opt'
default['firefox']['owner'] = 'root'
default['firefox']['group'] = 'root'
default['firefox']['mode'] = 755