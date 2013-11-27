require_relative 'spec_helper'

describe 'firefox::default' do
  let(:version) { '25.6.12' }
  let(:url) { "http//foo.bar/firefox-#{version}.tar.bz2" }
  let(:path) { '/path/to/firefox' }
  let(:owner) { 'firefoxuser' }
  let(:group) { 'firefoxgroup' }
  let(:permissions) { 777 }

  subject(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set['firefox']['version'] = version
      node.set['firefox']['source_url'] = url
      node.set['firefox']['path'] = path
      node.set['firefox']['owner'] = owner
      node.set['firefox']['group'] = group
      node.set['firefox']['mode'] = permissions
    end.converge described_recipe
  end

  it { should put_ark('firefox').with(path: path, owner: owner, group: group, mode: permissions, url: url) }
  it { should install_package('urw-fonts') }

end
