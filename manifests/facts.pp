class base::facts {
    file { '/etc/facts':
      ensure    => directory,
      path    => '/etc/facts',
      owner   => root,
      group   => root,
      mode    => 644,
  }
}
