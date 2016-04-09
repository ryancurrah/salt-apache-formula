shared_examples 'apache::base' do
  describe package('apache') do
    it { should be_installed }
  end
end
