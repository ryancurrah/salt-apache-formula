shared_examples 'apache::base' do
  describe package('httpd') do
    it { should be_installed }
  end

  describe user('apache') do
    it { should exist }
    it { should have_uid 48 }
    it { should have_login_shell '/sbin/nologin' }
    it { should belong_to_group 'apache' }
  end

  describe group('apache') do
    it { should exist }
     it { should have_gid 48 }
  end

  describe service('httpd') do
    it { should be_enabled }
    it { should be_running }
  end

  describe process('httpd') do
    it { should be_running }
    its(:user) { should eq 'root' }
  end

  describe file('/etc/httpd/conf/httpd.conf') do
    it { should be_owned_by('root') }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
  end
end
