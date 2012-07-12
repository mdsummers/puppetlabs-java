require 'spec_helper'

describe 'java::package_redhat' do

  describe 'install from params passed with no rpmsource' do
    let(:params) do
      { :version => '1.7.0', :distribution => 'jre' }
    end
    it { should contain_package('java').with({
      :ensure => '1.7.0',
      :name   => 'jre' })}
      debugger
  end
  describe 'should install from params passed with rpmsource' do
    let(:params) do
      { :version => '1.7.0', :distribution => 'jre', :rpmsource => '/tmp/jre' }
    end
    it { should contain_package('java').with({
      :ensure => '1.7.0',
      :name => 'jre',
      :provider => 'rpm',
      :source => '/tmp/jre' })}
  end
end
