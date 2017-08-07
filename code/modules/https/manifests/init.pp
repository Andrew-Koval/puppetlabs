# === Class: https
#
#  HTTPS Bazaarss for Apache HTTPD Web Server
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

class https {
  package { 'openssl':
    ensure => 'installed',
  }

  package { 'mod_ssl':
    ensure => 'installed',
  }

  file { '/etc/pki/tls/certs/bazaarss.crt':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/https/bazaarss.crt',
    require => Package['mod_ssl'],
  }

  file { '/etc/pki/tls/private/bazaarss.key':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/https/bazaarss.key',
    require => Package['mod_ssl'],
  }

  file { '/etc/pki/tls/private/bazaarss.csr':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/https/bazaarss.csr',
    require => Package['mod_ssl'],
  }
}

