require 'spec_helper'

describe 'java' do

  describe 'on RedHat-type systems' do
    let(:facts) do
      { :osfamily => 'RedHat' }
    end
    it { should contain_class 'java' }
    it { should contain_class 'java::package_redhat' }
    it { should_not contain_class 'java::package_debian' }

    describe 'should call package_redhat with parameters if passed' do
      let(:params) do
        { :distribution => 'jre', :version => '1.7.0', :packagesource => '/tmp/jre.rpm' }
      end
      it { should contain_class('java::package_redhat').with({
        :distribution => 'jre',
        :version      => '1.7.0',
        :rpmsource    => '/tmp/jre.rpm' })}
    end
    describe 'should call package_redhat with defaults if no params' do
      let(:params) {{}}
      it { should contain_class('java::package_redhat').with({
        :distribution => 'jdk',
        :version      => 'present',
        :rpmsource    => 'UNDEF' })}
    end
  end

  describe 'on Debian-type systems' do
    debian_oses = { 
      'squeeze' => 6,
      'lucid'   => 6,
      'wheezy'  => 7,
      'precise' => 7,
    }

    java_packages = {
      :java_6_jdk => 'openjdk-6-jdk',
      :java_6_jre => 'openjdk-6-jre-headless',
      :java_7_jdk => 'openjdk-7-jdk',
      :java_7_jre => 'openjdk-7-jre-headless',
    }

    debian_oses.each do |os,java_ver|
      describe "running #{os} with java #{java_ver}" do
        let(:facts) do
          { :osfamily => 'Debian', :lsbdistcodename => os }
        end
        it { should contain_class 'java' }
        describe "using default params" do
          it { should contain_class('java::package_debian').with({
            :distribution => "openjdk-#{java_ver}-jdk",
            :version      => 'present' })}
        end
        describe "using jre and specific version" do
          let (:params) do
            { :distribution => 'jre', :version => '1.7.0' }
          end
          it { should contain_class('java::package_debian').with({
            :distribution => "openjdk-#{java_ver}-jre-headless",
            :version      => '1.7.0' })}
        end

        it { should_not contain_class 'java::package_redhat' }
      end
    end
  end

end
