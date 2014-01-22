require_relative 'spec_helper'

describe 'firefox::default' do
  let(:version) { '25.6.12' }
  let(:url) { "http//foo.bar/firefox-#{version}.tar.bz2" }
  let(:path) { '/path/to/firefox' }
  let(:owner) { 'firefoxuser' }
  let(:group) { 'firefoxgroup' }
  let(:permissions) { 777 }

  def chef_run_for(platform_info)
    ChefSpec::Runner.new(platform_info) do |node|
      node.set[:firefox][:version] = version
      node.set[:firefox][:source_url] = url
      node.set[:firefox][:path] = path
      node.set[:firefox][:owner] = owner
      node.set[:firefox][:group] = group
      node.set[:firefox][:mode] = permissions
    end.converge described_recipe
  end

  context 'any platform' do
    subject { chef_run_for({}) }

    it { should put_ark('firefox').with(path: path, owner: owner, group: group, mode: permissions, url: url) }
  end

  context 'centos' do
    subject { chef_run_for(platform: 'centos', version: '6.4') }

    it { should install_package('urw-fonts') }
  end

  context 'ubuntu' do
    subject { chef_run_for(platform: 'ubuntu', version: '12.04') }

    it { should include_recipe 'apt' }
  end

end