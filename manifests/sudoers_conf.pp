class base::sudoers_conf {
      file { '/etc/sudoers':
              path    => '/etc/sudoers',
              owner   => root,
              group   => root,
              mode    => 440,
              source    => "puppet:///modules/Base/sudoers",
      }

      file { "/etc/security/access.conf":
        path    => '/etc/security/access.conf',
        owner   => root,
        group   => root,
        mode    => 644,
        source    => "puppet:///modules/Base/access.conf",
      }
}
