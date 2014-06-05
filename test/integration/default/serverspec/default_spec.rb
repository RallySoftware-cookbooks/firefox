require_relative 'spec_helper'

describe 'firefox::default' do
  
  describe command('/opt/firefox/firefox --version') do
    it { should return_stdout /^Mozilla Firefox/ }
  end

end
