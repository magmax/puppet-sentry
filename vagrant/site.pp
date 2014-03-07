node 'sentry-test' {
  include apt
  include ntp
  include sentry

  package {'python-pip':
    ensure => '1.4.1-2',
  }

  package {'python-urllib3':
    name     => 'urllib3',
    provider => 'pip',
    ensure   => present,
  }

  package {'python-django-south':
    name     => 'South',
    provider => 'pip',
    ensure   => '0.8.2',
  }

  package {'python-setproctitle':
    name     => 'setproctitle',
    provider => 'pip',
    ensure   => '1.1.8',
  }

  apt::repository { 'testing':
    url        => 'http://ftp.debian.org/debian/',
    distro     => 'testing',
    repository => 'main contrib',
  }

}
