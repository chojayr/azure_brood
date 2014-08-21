#!/usr/bin/env ruby
##
##

require "azure"
require "yaml"
require "net/http"
require "uri"
require "json"


Azure.configure do |config|
    ymlval = YAML.load(open('azure.yaml'))
    #2 properties to use Storage
    config.storage_account_name = ymlval["storage_account_name"]
    config.storage_access_key   = ymlval["storage_access_key"]

    # 3 properties to use Service Management. 
    config.management_certificate = ymlval["management_certificate"]
    config.subscription_id        = ymlval["subscription_id"]
    config.management_endpoint    = ymlval["management_endpoint"]
end

yml = YAML.load(open('hostname.yaml'))
ymlhost = yml["host"]

ymlhost.each do |vm|

  virtual_machine_service = Azure::VirtualMachineManagementService.new
  
  #This is to create VM and to start deployment
  params = {
    :vm_name => "#{vm}",
    :vm_user => 'yourusername',
    :image => '0b11de9248dd4d87b18621318e037d37__RightImage-Ubuntu-12.04-x64-v13.4', #sample available image
    :password => 'yourpassword',
    :location => 'Southeast Asia'
  }

  option = { 
    :cloud_service_name => "#{vm}",
    :deployment_name => "#{vm}",
    :tcp_endpoints => '22,80,8080,8443:443', #ports you need to open
    :certificate_file => '/path/to/your/file.pem',
    :vm_size => 'Basic_A1'
  }

  virtual_machine_service.create_virtual_machine(params,option)
  
end
