class base::crond {
    file { "/etc/cron.allow":
      owner   => root,
      group   => root,
      mode    => 400,
      source    => "puppet:///modules/Base/cron.allow"
    }

    file { "/etc/at.allow":
            owner   => root,
            group   => root,
            mode    => 400,
            source    => "puppet:///modules/Base/at.allow"
    }

    file { "/etc/cron.deny":
      ensure    => absent,
    }

    file { "/etc/at.deny":
      ensure    => absent,
    }
}
