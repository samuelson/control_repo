class profile::puppetboard {

  # Configure Apache on this server
  class { 'apache': }
  class { 'apache::mod::wsgi': }
  # Configure Puppetboard
  class{'puppetboard':
    manage_virtualenv => true
  }
  # Access Puppetboard through pboard.example.com
  class { 'puppetboard::apache::vhost':
    vhost      => 'localhost',
    port       => 80,
  }
}
