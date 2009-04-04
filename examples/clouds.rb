# Basic pool spec
# Shows global settings for the clouds
pool :application do
  instances 1..3
  keypair "auser-work"
  ami 'ami-7cfd1a15'  
  
  cloud :pp1 do
    has_file "/etc/motd", 
      :content => "Welcome to LARubyConf"
    has_file :name => "/var/www/index.html" do
      content "<h1>Welcome to your new poolparty instance</h1>"
    end
    
    chef do
      include_recipes "~/.poolparty/chef/cookbooks/*"
      
      recipe "#{File.dirname(__FILE__)}/examples/fairchild_chef.rb"
    end
  end

end