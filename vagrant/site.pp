node 'sentry-test' {
  include apt
  include ntp
  include sentry

  package {'python-pip':
    ensure => '1.4.1-2',
  }

  package {'python-urllib3':
    ensure => present,
  }

  package {'python-django-south':
    ensure => present,
  }

  apt::repository { 'testing':
    url        => 'http://ftp.debian.org/debian/',
    distro     => 'testing',
    repository => 'main contrib',
  }

}
