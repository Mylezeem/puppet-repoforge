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

  $baseurl = "http://apt.sw.be/redhat/el${::os_maj_version}/en/${::architecture}"
  $mirrorlist = "http://mirrorlist.repoforge.org/el${::os_maj_version}"

  $repos = {
    'rpmforge' => 'rpmforge',
    'extras'   => 'rpmforge-extras',
    'testing'  => 'rpmforge-testing',
  }

  $enabled = [ 'rpmforge' ]

}
