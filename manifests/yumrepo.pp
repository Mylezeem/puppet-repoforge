define repoforge::yumrepo (
  $repos,
  $baseurl,
  $mirrorlist,
  $enabled
) {
  $reponame = $repos[$title]

  validate_array($enabled)

  yumrepo {
    $reponame :
      descr      => "RHEL ${::os_maj_version} - RPMforge.net - ${reponame}",
      baseurl    => "${baseurl}/${reponame}",
      mirrorlist => "${mirrorlist}/mirrors-${reponame}",
      enabled    => bool2num(member($enabled,$title)),
      protect    => 0,
      gpgcheck   => 1,
      gpgkey     => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag",
  }
}
