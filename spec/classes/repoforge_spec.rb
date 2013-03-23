# spec/classes/repoforge_spec.pp
require 'spec_helper'

describe 'repoforge' do

    let(:facts) {
      {:osfamily => 'RedHat',}
    }

    let(:params) { {
      :enabled    => ['rpmforge'],
      :baseurl    => 'http://apt.sw.be/redhat/el6/en/i386',
      :mirrorlist => 'http://mirrorlist.repoforge.org/el6',
    } }

    it 'create the GPG key file' do
      should contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag').with({
        'ensure' => 'present',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
        'source' => 'puppet:///modules/repoforge/RPM-GPG-KEY-rpmforge-dag',
      })
    end

    it 'import the GPG key' do
      should contain_repoforge__rpm_gpg_key('RPM-GPG-KEY-rpmforge-dag').with({
        'path' => '/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag',
      })
    end

    it 'instantiate the yum repos' do
      should contain_repoforge__yumrepo('rpmforge').with({
         'repos'      => {"testing"=>"rpmforge-testing", "rpmforge"=>"rpmforge", "extras"=>"rpmforge-extras"},
         'baseurl'    => 'http://apt.sw.be/redhat/el6/en/i386',
         'mirrorlist' => 'http://mirrorlist.repoforge.org/el6',
         'enabled'    => ['rpmforge'],
      })
    end

end
