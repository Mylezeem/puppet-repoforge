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

  $repoforge_package = "rpmforge-release-0.5.2-2.el${::lsbmajdistrelease}.rf.${arch}"

  $repoforge_url = "http://pkgs.repoforge.org/rpmforge-release/${repoforge_package}.rpm"

}
