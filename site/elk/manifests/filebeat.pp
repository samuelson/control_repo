# elk::filebeat
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include elk::filebeat
class elk::filebeat (
  $prospectors = [],
  $logstash_server = '127.0.0.1',
  $logstash_port = '5044'
) {
  package {'filebeat':
    ensure => present,
  }
  include elastic_stack::repo
  Elk::Filebeat_config <<| title == "main" |>> { 
    prospectors => [{  
      "type" => "log",  
      "paths" => [  
        "/var/log/puppetlabs/puppetserver/puppetserver.log.json",  
        "/var/log/puppetlabs/puppetserver/puppetserver-access.log.json",  
      ],  
      "json_keys_under_root" => true  
    }], 
  } 
  service{'filebeat':
    ensure => running,
    enable => true,
  }
}
