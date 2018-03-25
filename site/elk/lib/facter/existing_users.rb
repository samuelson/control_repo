Facter.add('existing_users') do 
  setcode do 
    Facter::Core::Execution.execute('/usr/bin/getent passwd') 
  end 
end 
