class base::set_repos {



    yumrepo { "MongoDB":
      baseurl   => "http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/",
      descr   => "MongoDB Repository",
      enabled   => 1,
      gpgcheck  => 0,
    }
}
