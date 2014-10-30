require_relative 'spec_helper'

describe 'firefox::default' do
  
  describe command('/opt/firefox/firefox --version') do
    its(:stdout) { should match /^Mozilla Firefox/ }
  end

end
