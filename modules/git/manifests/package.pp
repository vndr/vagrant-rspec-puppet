# == Class: git::package
#
# This class exists to coordinate all software package management related
# actions, functionality and logical units in a central place.
#
#
# === Parameters
#
# This class does not provide any parameters.
#
#
# === Examples
#
# This class may be imported by other classes to use its functionality:
#   class { 'git::package': }
#
# It is not intended to be used directly by external resources like node
# definitions or other modules.
#
#
# === Authors
#
# * vndr <mailto:jv.vndr@gmail.com>
#
class git::package {

  package { 'git-core':
	ensure => latest
  }


  #### Package management

  # set params: in operation
  if $git::ensure == 'present' {

    $package_ensure = $git::autoupgrade ? {
      true  => 'latest',
      false => 'present',
    }

  # set params: removal
  } else {
    $package_ensure = 'purged'
  }

  # action
  package { $git::params::package:
    ensure => $package_ensure,
  }

}
