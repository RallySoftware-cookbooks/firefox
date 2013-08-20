default['firefox']['version'] = '22.0'
default['firefox']['source_url'] = "https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/#{node['firefox']['version']}/linux-i686/en-US/firefox-#{node['firefox']['version']}.tar.bz2"
default['firefox']['path'] = '/opt'
default['firefox']['owner'] = 'root'
default['firefox']['group'] = 'root'
default['firefox']['mode'] = 755
