class base::ssh_config {
    file { '/etc/ssh/sshd_config':
      path    => "/etc/ssh/sshd_config",
                  owner   => root,
                  group   => root,
                  mode    => 600,
      source    => 'puppet:///modules/Base/sshd_config',
    }

    service { 'sshd':
      ensure    => running,
      subscribe => File["/etc/ssh/sshd_config"],
      require   => File['/etc/ssh/sshd_config'],
    }
}
