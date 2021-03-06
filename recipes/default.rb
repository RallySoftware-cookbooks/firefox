#
# Cookbook Name:: firefox
# Recipe:: default
#
# Copyright (c) 2013 Rally Software Development Corp
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

include_recipe 'ark'

source_url = node[:firefox][:source_url] || "https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/#{node[:firefox][:version]}/#{node[:firefox][:arch]}/en-US/firefox-#{node[:firefox][:version]}.tar.bz2"

ark 'firefox' do    
  action :put
  url   source_url
  path  node[:firefox][:path]
  owner node[:firefox][:owner]
  group node[:firefox][:group]
  mode  node[:firefox][:mode]
end

case node[:platform]
when 'centos'
  dependencies = ['glibc', 'libstdc++-devel', 'libXrender', 'alsa-lib', 'libXext', 
                  'gtk2', 'libXt']


  dependencies.each do |dep|
    yum_package dep do
      arch 'i686'
    end
  end

  yum_package 'dbus-glib' do
    arch 'i686'
    action :install
    options '--setopt=protected_multilib=false'
  end

  package 'urw-fonts'

when 'ubuntu'
  include_recipe 'apt'

  %w(libxt6 libxrender1 libasound2 libgtk2.0-0).each do |dep|
    package dep
  end
end
