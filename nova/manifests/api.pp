class nova::api($enabled=false) inherits nova {

  if $enabled {
    $service_ensure = 'running'
  } else {
    $service_ensure = 'stopped'
  }

  package { "nova-api":
    ensure  => present,
    require => Package["python-greenlet"],
  }
  service { "nova-api":
    ensure  => $service_ensure,
    enable  => $enabled,
    require => Package["nova-api"],
    #subscribe => File["/etc/nova/nova.conf"]
  }
}
