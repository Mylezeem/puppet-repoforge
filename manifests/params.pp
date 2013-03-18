# Class: repoforge::params
#
#  The repoforge configuration settings
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class repoforge::params {

  $arch = $::lsbmajdistrelease ? {
    '6'     => $::architecture ? {'i386' => 'i686', default => $::architecture,},
    default => $::architecture,
  }

  $baseurl = "http://apt.sw.be/redhat/el${::os_maj_version}/en/${::arch}"
  $mirrorlist = "http://apt.sw.be/redhat/el${::os_maj_version}/en"

  $repos = {
    'rpmforge' => 'rpmforge',
    'extras'   => 'rpmforge-extras',
    'testing'  => 'rpmforge-testing',
  }

  $enabled = [ 'rpmforge' ]

}
