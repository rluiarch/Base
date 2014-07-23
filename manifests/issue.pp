class base::issue {
        file { '/etc/issue':
                path    => "/etc/issue",
                owner   => root,
                group   => root,
                mode    => 644,
                source    => 'puppet:///modules/Base/issue',
        }
}
