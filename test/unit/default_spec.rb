require_relative 'spec_helper'

describe 'firefox::default' do
  let(:version) { '25.6.12' }
  let(:url) { "http//foo.bar/firefox-#{version}.tar.bz2" }
  let(:path) { '/path/to/firefox' }
  let(:owner) { 'firefoxuser' }
  let(:group) { 'firefoxgroup' }
  let(:permissions) { 777 }
  
  let (:chef_run) do
    ChefSpec::ChefRunner.new(:step_into => [:ark]) do |node|
      node.set['firefox']['version'] = version
      node.set['firefox']['source_url'] = url
      node.set['firefox']['path'] = path
      node.set['firefox']['owner'] = owner
      node.set['firefox']['group'] = group
      node.set['firefox']['mode'] = permissions
    end
  end

  subject { chef_run.converge 'firefox::default' }
  
  it { should install_ark('firefox', path) }
  it { should owner_group_ark('firefox', owner, group) }
  it { should mode_ark('firefox', permissions) }
  it { should url_ark('firefox', url) }

end
