require 'optparse'

# Create our Object
RemoteClient = Struct.new(:ip, :username)

class Push

    # This will generate our initial key
    def generateKey 
       system "ssh-keygen"     
    end

    # This will copy the key to the desired host
    def copyKey (ip, username)
        
        puts "Connecting to #{ip} with User -> #{username}....."

        # Magic Command - the mirror to ssh-copy-id
        system "cat ~/.ssh/id_rsa.pub | ssh #{username}@#{ip} 'mkdir ~/.ssh; cat >> ~/.ssh/authorized_keys'"
    end

    # Will get the hosts we want to deploy the public key too
    def getHosts

       file = "config.lst"
       if File.exist?(file)
            lstArray = File.readlines(file).map do |line|
            # Used ";" to avoid \t (TAB) which is different across OS'es
            RemoteClient.new( *line.split("\;") )
            end
        end
       
    end

end

# Options 
options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: pushId.rb [options]"
  options[:ignore] = true

  opts.on('-g', '--ignore-gen', 'Ignore SSH Key Generation') do
    options[:ignore] = false 
  end

  # This displays the help screen, all programs are
  # assumed to have this option.
  opts.on( '-h', '--help', 'Display this screen' ) do
     puts opts
     exit
  end
  
end.parse!

# Array for Result 
lstArray = Array.new

# Instantiate 
myInst = Push.new

# Generate Public/Private Key (but ignore if desired)
if options[:ignore]
    myInst.generateKey 
end

# Get Hosts and Push Key
lstArray = myInst.getHosts

# SSH-Copy Id
lstArray.each do |client|
    myInst.copyKey client.ip, client.username.strip!
end

# Confirmation
puts "Done"
