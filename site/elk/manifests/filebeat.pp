# elk::filebeat
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include elk::filebeat
class elk::filebeat (
  $logstash_server = '127.0.0.1',
  $logstash_port = '127.0.0.1'
) {
  package {'filebeat':
    ensure => present,
  }
  include elastic_stack::repo
  file {'/etc/filebeat/filebeat.yml':
    ensure => file
    content => epp('elk/filebeat.yml.epp',{
      logstash_server => $logstash_server,
      logstash_port => $logstash_port
    })
  }
}
