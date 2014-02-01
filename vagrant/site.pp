node 'sentry-test' {
  include ntp
  include sentry

  package {'python-pip':
    ensure => true
  }
}
