## Description
Install and configure firefox.

NOTE: available firefox versions are here:   https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/

## Requirements
### Platform
List the supported platforms from the metadata.rb file -
* Centos 6.4
* Ubuntu 12.04

## Attributes
### default
See `attributes/default.rb` for default values

* `node['firefox']['version']` - The version of firefox to install
* `node['firefox']['source_url']` - Where to fetch the firefox installation. This attribute uses the `node[:firefox][:version]` to build its value.
* `node['firefox']['path']` - Where to install firefox
* `node['firefox']['owner']` - Who should own the firefox installation
* `node['firefox']['group']` - What group should the firefox installation belong to
* `node['firefox']['mode']` - File mode for the firefox installation

## Recipes
###default
This recipe uses ark to download and unzip the firefox installation to the provided path. It then uses yum to install the following dependent packages - `['glibc', 'libstdc++-devel', 'libXrender', 'alsa-lib', 'libXext', 'pango-devel', 'gtk2', 'libXt']`. 

## License
Copyright (C) 2013 Rally Software Development Corp

Distributed under the MIT License.
