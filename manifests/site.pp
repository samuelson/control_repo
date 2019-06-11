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
  include dockeragent::node {'web.puppet.vm'}
  include dockeragent::node {'db.puppet.vm' }
}
