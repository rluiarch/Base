class base::set_repos {

    yumrepo { "RCS-Custom":
      baseurl   => "http://54.193.1.156/RCS-Custom/",
      descr   => "RCS Custom Repository",
      enabled   => 1,
      gpgcheck  => 0,
    }

    yumrepo { "MongoDB":
      baseurl   => "http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/",
      descr   => "MongoDB Repository",
      enabled   => 1,
      gpgcheck  => 0,
    }
}
