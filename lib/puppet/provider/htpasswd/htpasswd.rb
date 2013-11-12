Puppet::Type.type(:htpasswd).provide(:htpasswd) do
  confine :kernel => :linux
  defaultfor :kernel => :linux
  commands :htpasswd => 'htpasswd', :grep => 'grep', :touch => 'touch'

  def exists?
    begin
      grep("-sP", "^" + resource[:user] + ":", resource[:passwordfile])
    rescue Puppet::ExecutionFailure => e
      false
    end
  end

  def create
    touch(resource[:passwordfile]) unless File.exists?(resource[:passwordfile])
    htpasswd('-pb', resource[:passwordfile], resource[:user], resource[:password])
  end

  def password
    password = grep("-sP", "^" + resource[:user] + ":", resource[:passwordfile])
    if password =~ /^.*?:(.*)$/
      $1
    end
  end

  def password=(value)
    htpasswd('-pb', resource[:passwordfile], resource[:user], resource[:password])
  end

  def destroy
    htpasswd('-D', resource[:passwordfile], resource[:user])
  end

end
