# Class: repoforge
#
#  The class ensures repoforge repo is installed
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#  include repoforge
class repoforge inherits repoforge::params {

  if $::osfamily == 'RedHat' {

    yumrepo {'rpmforge' :
      descr      => "RHEL ${::os_maj_version} - RPMforge.net - dag",
      baseurl    => "http://apt.sw.be/redhat/el${::os_maj_version}/en/${::arch}/rpmforge",
      mirrorlist => "http://apt.sw.be/redhat/el${::os_maj_version}/en/mirrors-rpmforge",
      enabled    => 1,
      protect    => 0,
      gpgcheck   => 1,
      gpgkey     => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag",
    }

    yumrepo {'rpmforge-extras' :
      descr      => "RHEL ${::os_maj_version} - RPMforge.net - extras",
      baseurl    => "http://apt.sw.be/redhat/el${::os_maj_version}/en/${::arch}/extras",
      mirrorlist => "http://apt.sw.be/redhat/el${::os_maj_version}/en/mirrors-rpmforge-extras",
      enabled    => 0,
      protect    => 0,
      gpgcheck   => 1,
      gpgkey     => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag",
    }

    yumrepo {'rpmforge-testing' :
      descr      => "RHEL ${::os_maj_version} - RPMforge.net - testing",
      baseurl    => "http://apt.sw.be/redhat/el${::os_maj_version}/en/${::arch}/testing",
      mirrorlist => "http://apt.sw.be/redhat/el${::os_maj_version}/en/mirrors-rpmforge-testing",
      enabled    => 0,
      protect    => 0,
      gpgcheck   => 1,
      gpgkey     => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag",
    }

    file {"/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag" :
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/repoforge/RPM-GPG-KEY-rpmforge-dag',
    }

    repoforge::rpm_gpg_key { "RPM-GPG-KEY-rpmforge-dag" :
      path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag",
    }

  } else {
    notice ("Your operating system ${::operatingsystem} will not have the RepoForge repository applied")
  }

}
