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

  exec {"rpm -Uvh ${repoforge_url}" :
    unless => "rpm -q ${repoforge_package}",
  }

}
