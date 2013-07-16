require_relative 'spec_helper'

describe 'firefox::default' do
  
  describe command('/opt/firefox/firefox') do
    it { should return_stdout 'Error: no display specified' }
  end

end
