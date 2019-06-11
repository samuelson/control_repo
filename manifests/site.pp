node default {

}
node puppet.local {
  include role::master
}

node elk.local {
  include role::elk
}

node master.puppet.vm {
  include dockeragent
  dockeragent::node {'web.puppet.vm':}
  dockeragent::node {'db.puppet.vm':}
}

node /^web/ {
  file {"/foo.txt": ensure => file}
}
