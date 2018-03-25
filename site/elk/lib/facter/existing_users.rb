Facter.add('existing_users') do 
  setcode do 
    users = Facter::Core::Execution.execute('/usr/bin/getent passwd')
    users.split("/n")
  end 
end 
