Facter.add('existing_users') do 
  setcode do 
    Facter::Core::Execution.execute('/bin/getent passwd') 
  end 
end 
