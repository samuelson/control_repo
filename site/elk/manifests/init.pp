# elk
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include elk
class elk {
  class {'logstash':
    settings => {
      'http.host' => '0.0.0.0',
      'http.port' => '5044'
      }
  }
  logstash::plugin {'logstash-http-input':}

  include ::java
  class { 'elasticsearch':
    jvm_options => [
      '-Xms256m',
      '-Xmx256m'
    ]
  }
  elasticsearch::instance {'es-01':}

  class{'kibana': config => {'server.host' => '0.0.0.0'}}

  include elk::filebeat
}
