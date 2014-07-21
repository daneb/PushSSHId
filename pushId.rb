class Push
    def generateKey 
       system "ssh-keygen"     
    end

    def copyKey (ip, username)
        puts "Connecting to #{ip} with User -> #{username}....."
        system "cat ~/.ssh/id_rsa.pub | ssh #{username}@#{ip} 'mkdir ~/.ssh; cat >> ~/.ssh/authorized_keys'"
    end

    def getHosts
       puts "Getting hosts to process ....."
       file = File.open("config.lst")
       puts File.exist?("config.lst")
       lstArray = file.readlines.map do |line|
           RemoteClient.new( *line.split("\t") )
        end
    end

end

# Global Array 
lstArray = Array.new

# Create our Object
RemoteClient = Struct.new(:ip, :username)

# Instantiate 
myInst = Push.new

# Generate Public/Private Key
#myInst.generateKey 

# Get Hosts and Push Key
myInst.getHosts

# Print
puts lstArray.empty?
lstArray.each do |client|
    puts client.ip
end
