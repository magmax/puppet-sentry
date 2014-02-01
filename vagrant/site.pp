node 'sentry-test' {
  include apt
  include ntp
  include sentry

  package {'python-pip':
    ensure => '1.4.1-2',
  }

  apt::repository { 'testing':
    url        => 'http://ftp.debian.org/debian/',
    distro     => 'testing',
    repository => 'main contrib',
  }

}
