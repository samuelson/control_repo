define elk::filebeat_config( 
  $prospectors = [], 
  $logstash_server = '127.0.0.1', 
  $logstash_port = '5044', 
) { 
 
file {'/etc/filebeat/filebeat.yml': 
  ensure => file, 
  content => epp ('elk/filebeat.yml.epp',{ 
    prospectors => $prospectors, 
    logstash_server => $logstash_server, 
    logstash_port => $logstash_port, 
  }) 
} 
