class base::users {
    group { 'rcsbot':
            ensure          => present,
            gid   => 501,
    }

    group { 'rlui':
            ensure          => present,
            gid   => 1914,
    }

    group { 'sshah':
            ensure          => present,
            gid           => 1916,
    }

    group { 'phegde':
            ensure          => present,
            gid           => 1917,
    }


    user { 'rcsbot':
            ensure    => present,
            uid   => 501,
            gid   => 'rcsbot',
            password  => '$6$Z2O1Ldh6$mMRRO09/Uy6Wrl2w25zGdh.hCXJ.Ea0c5QkWgThWNaCiDZ0Magn9Uk.VF1ThCD7HbhbotJvBlkhp2dxBEddSq/',
            comment   => '$hostname rcsbot',
            groups    => ["rcsbot","wheel"],
            require   => Package['ruby-shadow'],
            managehome  => true,
    }


    user { 'rlui':
            ensure    => present,
            uid   => 1914,
            gid   => 'lakassa',
            password  => '$1$hLRSGNAI$R..jSQC7yM4TdYT0CxxUN1',
            comment   => '$hostname rlui',
            #groups   => ["rlui","wheel"],
            require   => Package['ruby-shadow'],
            managehome  => true,
    }


    user { 'astarov':
            ensure    => present,
            uid   => 1916,
            gid   => 'sshah',
            password  => '$1$u0dMKAVg$T6bIjn5pqe2KJcyzx6qxO0',
            comment   => '$hostname sshah',
            #groups   => ["sshah","wheel"],
            require   => Package['ruby-shadow'],
            managehome  => true,
    }

    user { 'tslankard':
            ensure    => present,
            uid   => 1917,
            gid   => 'phegde',
            password  => '$1$hgAlrrT0$xYgRv0aZQc668bofs22eC1',
            comment   => '$hostname phegde',
            #groups   => ["tslankard","wheel"],
            require   => Package['ruby-shadow'],
            managehome  => true,
    }
    

    user { 'root':
      comment   => $hostname,
                  password  => '$6$P75AltnrhB6TLqMy$FkFmTV7pi.r/ylJnJqGY1RqyjNAOu7fT7.8TJ91VM5hGQ4Rg0fLAQ2aPP4qiqCkhQ8sWN5sC4ksHtElHRAURC1',
    }


    package { 'ruby-shadow':
      ensure    => present,
      provider  => yum,
    }

    package { 'oddjob':
      ensure    => present,
      provider  => yum,
    }

    service { 'oddjobd':
                  ensure          => "running",
                  enable          => "true",
      require   => Package['oddjob'],
      hasstatus => true,
    }


    file { '/home/users':
      ensure    => directory,
      owner   => root,
      group   => root,
      mode    => 777,
    }

    file { [ '/home/rcsbot/.ssh' ]:
            mode            => 700,
            owner           => rcsbot,
            group           => rcsbot,
            ensure          => directory,
            require         => User['rcsbot'],
    }

    file { '/home/rcsbot/.ssh/authorized_keys':
           # path            => "/home/rcsbot/.ssh/authorized_keys",
            ensure    => present,
            owner           => rcsbot,
            group           => rcsbot,
            mode            => 600,
            source          => 'puppet:///modules/users/authorized_keys.rcsbot',
            require         => User['rcsbot'],
    }

    file { '/home/rcsbot/.ssh/id_rsa':
            path            => "/home/rcsbot/.ssh/id_rsa",
            owner           => rcsbot,
            group           => rcsbot,
            mode            => 600,
            source          => 'puppet:///modules/users/id_rsa.rcsbot',
            require         => User['rcsbot'],
    }

    file { '/home/rcsbot/.bash_profile':
      ensure    => present,
      owner   => rcsbot,
      group   => rcsbot,
      mode    => 644,
      source    => 'puppet:///modules/users/rcsbot/.bash_profile.rcsbot',
      require   => User['rcsbot'],
    }

    file { '/etc/profile':
      ensure    => present,
                  owner   => root,
                  group   => root,
                  mode    => 644,
                  source    => 'puppet:///modules/users/profile',
    }
}
