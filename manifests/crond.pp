class crond {
    file { "/etc/cron.allow":
      owner   => root,
      group   => root,
      mode    => 400,
      source    => "puppet:///modules/crond/cron.allow"
    }

    file { "/etc/at.allow":
            owner   => root,
            group   => root,
            mode    => 400,
            source    => "puppet:///modules/crond/at.allow"
    }

    file { "/etc/cron.deny":
      ensure    => absent,
    }

    file { "/etc/at.deny":
      ensure    => absent,
    }
}
