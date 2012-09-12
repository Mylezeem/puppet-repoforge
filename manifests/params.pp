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

}
