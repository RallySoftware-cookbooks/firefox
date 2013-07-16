require 'chefspec'
require 'cookbook/development/ext/chefspec'

module ChefSpec
  module Matchers

    RSpec::Matchers.define :install_ark do |package_name, path|
      match do |chef_run|
        chef_run.resources.any? do |resource|
          resource_type(resource) == 'ark' && resource.name == package_name &&
          resource.path == path
        end
      end
    end

    RSpec::Matchers.define :owner_group_ark do |package_name, owner, group|
      match do |chef_run|
        chef_run.resources.any? do |resource|
          resource_type(resource) == 'ark' && resource.name == package_name &&
            resource.owner == owner && resource.group == group
        end
      end
    end

    RSpec::Matchers.define :url_ark do |package_name, url|
      match do |chef_run|
        chef_run.resources.any? do |resource|
          resource_type(resource) == 'ark' && resource.name == package_name &&
          resource.url == url
        end
      end
    end

    # Due to flakyness with how 'resource.mode' is stored at times in chef_run,
    # we are testing 'resource.mode' here against the passed in 'mode' as 
    # either in decimal or octal numeric representation.
    RSpec::Matchers.define :mode_ark do |package_name, mode|
      match do |chef_run|
        chef_run.resources.any? do |resource|
          resource_type(resource) == 'ark' && resource.name == package_name &&
            (resource.mode == mode || resource.mode == "#{mode}".oct)
        end
      end
    end

  end
end