shared_examples 'apache::base' do
  describe package('httpd') do
    it { should be_installed }
  end
end
