# === Class: profiles::subversion_server
#
#  Profile for deploying of Subversion Server
#
# === Parameters
#
# None
#
# === Variables
#
# None
#
# === Examples
#
# None
#
# === Authors
#
# Andriy Koval <akova@softserveinc.com>
#
# === Copyright
#
# Copyright 2017 Andriy Koval
#

class profiles::subversion_server {

  class { 'subversion::svn':
    before => Class['subversion::svn_configs'],
  }

  class { 'subversion::svn_configs':
    require => Class['subversion::svn'],
  }

  class {'subversion::svn_repos':
   require => Class['subversion::svn'],
  }

  class { 'subversion::svn_admin':
    require => Class['subversion::svn_configs'],
  }

  class {'subversion::svn_users':
   require => Class['subversion::svn_admin'],
  }

  class { 'https':
    require => Class['subversion::svn_admin'],
    before  => Class['httpd'],
  }

  class { 'httpd':
    require => Class['https'],
  }
}
