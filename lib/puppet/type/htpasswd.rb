require 'pathname'
Puppet::Type.newtype(:htpasswd) do
  desc 'The htpasswd type manages usernames and passwords in htpasswd files'
  ensurable
  newparam(:user, :namevar => true) do
    desc 'The user is the username of the htpasswd file'
    validate do |value|
      fail("#{user} is not a valid username") unless value =~ /^[a-zA-Z0-9\-\_]+$/
    end
  end
  newproperty(:password) do
    desc 'The password is username\'s password of the htpasswd file'
    validate do |value|
      fail("Password should be at least 3 characters") unless value =~ /^...+$/
    end
  end
  newparam(:passwordfile) do
    desc 'This is the file that contains the username and password'
    validate do |value|
      unless Pathname.new(value).absolute?
        fail("Invalid passwordfile #{value}")
      end
    end
  end
end
